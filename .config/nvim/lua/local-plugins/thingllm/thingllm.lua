-- TODO: chat window
-- TODO: add CONTEXT.md functionality file in project root.
-- TODO: prompt template selection functionality.
-- TODO: prompt template editing functionality.
-- TODO: provider functionality.
-- TODO: default provider functionality.
-- TODO: provider selector.
-- TODO: context includor.
-- TODO: simple prompt template engine

--- Main module table.
local M = {}

--- Import plenary job module.
local Job = require 'plenary.job'

--- Create a new autocommand group for ThingLLM that will be used to handle user escape action.
local group = vim.api.nvim_create_augroup('THINGLLM__AutoGroup', { clear = true })

-- Represents the currently active job in plugin.
local active_job = nil

--- Get the API from the environment variables.
-- @param name The name of the environment variable to retrieve.
-- @return The value of the specified environment variable.
local function get_api_key(name)
  return os.getenv(name)
end

---
-- Retrieves all lines from the start of the buffer up to the cursor's current row.
--
-- This function collects the text content of the current buffer from the beginning
-- up to the line where the cursor is positioned and concatenates it into a single string.
--
-- @return string The concatenated lines from the start of the buffer to the cursor's row.

function M.get_lines_until_cursor()
  -- Get the current buffer and window.
  local current_buffer = vim.api.nvim_get_current_buf()
  local current_window = vim.api.nvim_get_current_win()

  -- Get the cursor position in the current window.
  local cursor_position = vim.api.nvim_win_get_cursor(current_window)
  local row = cursor_position[1]

  -- Retrieve all lines from the start of the buffer up to the cursor's row.
  local lines = vim.api.nvim_buf_get_lines(current_buffer, 0, row, true)

  -- Concatenate the retrieved lines with newline characters.
  return table.concat(lines, '\n')
end

--- Get the visual selection in the current buffer.
function M.get_visual_selection()
  -- Get starting and ending positions for the visual selection
  local _, srow, scol = unpack(vim.fn.getpos 'v')
  local _, erow, ecol = unpack(vim.fn.getpos '.')

  -- Handle line-wise visual mode
  if vim.fn.mode() == 'V' then
    if srow > erow then
      return vim.api.nvim_buf_get_lines(0, erow - 1, srow, true)
    else
      return vim.api.nvim_buf_get_lines(0, srow - 1, erow, true)
    end
  end

  -- Handle character-wise visual mode
  if vim.fn.mode() == 'v' then
    if srow < erow or (srow == erow and scol <= ecol) then
      return vim.api.nvim_buf_get_text(0, srow - 1, scol - 1, erow - 1, ecol, {})
    else
      return vim.api.nvim_buf_get_text(0, erow - 1, ecol - 1, srow - 1, scol, {})
    end
  end

  -- Handle block-wise visual mode
  if vim.fn.mode() == '\22' then
    local lines = {}

    -- Normalize selection coordinates if necessary
    if srow > erow then
      srow, erow = erow, srow
    end
    if scol > ecol then
      scol, ecol = ecol, scol
    end

    -- Collect text from each line in the block
    for i = srow, erow do
      table.insert(lines,
        vim.api.nvim_buf_get_text(0, i - 1, math.min(scol - 1, ecol), i - 1, math.max(scol - 1, ecol), {})[1])
    end

    return lines
  end
end

--- Generates curl arguments for making a request to Anthropic API.
--
-- Constructs the necessary curl arguments based on the provided options, user prompt, and system prompt.
--
-- @param opts table containing options like URL, API key name, and model.
-- @param prompt string user input prompt.
-- @param system_prompt string system level prompt.
-- @return table curl arguments for the API request.
-- @throw error if API key retrieval fails.
function M.make_anthropic_spec_curl_args(opts, prompt, system_prompt)
  -- Retrieve the URL and API key from the options
  local url = opts.url
  local api_key = opts.api_key_name and get_api_key(opts.api_key_name)

  -- Prepare the data payload for the API request
  local data = {
    system = system_prompt,
    messages = { { role = 'user', content = prompt } },
    model = opts.model,
    stream = true,
    max_tokens = 4096,
  }

  -- Initialize the curl arguments
  local args = { '-N', '-X', 'POST', '-H', 'Content-Type: application/json', '-d', vim.json.encode(data) }

  -- Add API key to the headers if available
  if api_key then
    table.insert(args, '-H')
    table.insert(args, 'x-api-key: ' .. api_key)
    table.insert(args, '-H')
    table.insert(args, 'anthropic-version: 2023-06-01')
  end

  -- Add the URL to the arguments
  table.insert(args, url)

  return args
end

--- Generates curl arguments for making a request to the OpenAI API.
--
-- This function prepares the necessary curl arguments, including headers and data payload,
-- for making a POST request to the OpenAI API using the provided options, prompt, and system prompt.
--
-- @param opts table A table containing options such as URL, API key name, and model.
-- @param prompt string The user prompt to be sent to the OpenAI API.
-- @param system_prompt string The system prompt to be included in the request.
-- @return table A list of curl arguments for the API request.
function M.make_openai_spec_curl_args(opts, prompt, system_prompt)
  -- Extract the URL and API key from the options
  local url = opts.url
  local api_key = opts.api_key_name and get_api_key(opts.api_key_name)
  local temperature = opts.temperature or 0.7

  -- Prepare the data payload for the API request
  local data = {
    messages = {
      { role = 'system', content = system_prompt },
      { role = 'user',   content = prompt }
    },
    model = opts.model,
    temperature = temperature,
    stream = true,
  }

  -- Initialize curl arguments with necessary headers and data
  local args = { '-N', '-X', 'POST', '-H', 'Content-Type: application/json', '-d', vim.json.encode(data) }

  -- If an API key is provided, add it to the headers
  if api_key then
    table.insert(args, '-H')
    table.insert(args, 'Authorization: Bearer ' .. api_key)
  end

  -- Add the URL to the curl arguments
  table.insert(args, url)

  -- Return the complete list of curl arguments
  return args
end

--- Writes a string at the current cursor position.
--
-- This function schedules an insertion operation to run in the main loop of Neovim.
-- It splits the input string by newline characters and inserts the lines at the current
-- cursor position, preserving the undo history. Finally, it sets the cursor to the end
-- of the inserted text.
--
-- @param str The string to be inserted at the cursor position.
local function write_string_at_cursor(str)
  -- Schedule the function to run in the main loop
  vim.schedule(function()
    -- Get the current window
    local current_window = vim.api.nvim_get_current_win()

    -- Get the current cursor position
    local cursor_position = vim.api.nvim_win_get_cursor(current_window)
    local row, col = cursor_position[1], cursor_position[2]

    -- Split the input string by newline characters
    local lines = vim.split(str, '\n')

    -- Join the undo history before inserting new lines
    vim.cmd("undojoin")

    -- Insert the lines at the current cursor position
    vim.api.nvim_put(lines, 'c', true, true)

    -- Calculate the new cursor position
    local num_lines = #lines
    local last_line_length = #lines[num_lines]

    -- Set the cursor to the end of the inserted text
    vim.api.nvim_win_set_cursor(current_window, { row + num_lines - 1, col + last_line_length })
  end)
end

--- Generate a prompt based on visual selection or cursor position.
-- If there is a visual selection, it retrieves the lines and optionally replaces them.
-- If there is no visual selection, it gets the lines from the start to the cursor position.
-- @param opts table: Options containing the 'replace' flag.
-- @return string: The generated prompt.
local function get_prompt(opts)
  -- Retrieve the replace option and the visual selection of lines
  local replace = opts.replace
  local visual_lines = M.get_visual_selection()
  local prompt = ''

  -- Check if there is a visual selection
  if visual_lines then
    -- Concatenate the visual selection into a single string with newline separators
    prompt = table.concat(visual_lines, '\n')

    if replace then
      -- Include the file name and range as context
      local file_name = vim.fn.expand('%:t')
      prompt = string.format("File: %s\n\n%s", file_name, prompt)

      vim.api.nvim_command 'normal! d'
      -- open a new line above the cursor to make up for the deleted lines
      vim.api.nvim_command 'normal! O'
    else
      -- If replace is false, exit visual mode
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', false, true, true), 'nx', false)
    end
  else
    -- If no visual selection, get the lines from the start to the cursor position
    prompt = M.get_lines_until_cursor()
  end

  return prompt
end

--- Handles the Anthropics specification data by processing the data stream and event state.
--- If the event state indicates a content block delta, it decodes the JSON data from the stream,
--- logs it for debugging, and writes the text delta at the cursor position.
---
--- @param data_stream string The data stream containing JSON encoded information.
--- @param event_state string The state of the event to determine how to handle the data.
---
function M.handle_anthropic_spec_data(data_stream, event_state)
  -- Check if the event state indicates a content block delta
  if event_state == 'content_block_delta' then
    -- Decode the JSON data from the data stream
    local json = vim.json.decode(data_stream)

    -- If the JSON contains a text delta, write the text at the cursor position
    if json.delta and json.delta.text then
      write_string_at_cursor(json.delta.text)
      return json.delta.text
    end
  end
end

---
-- Handle the OpenAI specification data stream.
--
-- This function processes a JSON-encoded data stream from OpenAI, extracts the content
-- within the 'delta' field, and writes it at the cursor position.
--
-- @param data_stream The JSON-encoded data stream to be processed.
-- @return The extracted content if available.
-- @throw If the JSON decoding fails or the expected structure is not found.
function M.handle_openai_spec_data(data_stream)
  -- Check if the data_stream contains the keyword "delta"
  if data_stream:match '"delta":' then
    -- Decode the JSON data from the stream
    local json = vim.json.decode(data_stream)

    -- Ensure the decoded JSON contains the necessary structure
    if json.choices and json.choices[1] and json.choices[1].delta then
      -- Extract the content within the delta
      local content = json.choices[1].delta.content
      if content then
        -- Write the extracted content at the cursor position
        write_string_at_cursor(content)
        return content
      end
    end
  end
end

--- Invokes a language model and streams the output into the editor.
--
-- This function sets up and manages a job to invoke a language model via a curl command.
-- It streams the output back into the editor, handling data and events as they occur.
--
-- @param opts table The options for invoking the language model, including the system prompt.
-- @param make_curl_args_fn function A function to generate curl arguments based on the provided options and prompts.
-- @param handle_data_fn function A function to handle data received from the language model.
--
-- @return Job The active job that is streaming the language model output.
-- @throws error Throws an error if the system prompt is missing.
function M.invoke_llm_and_stream_into_editor(opts, make_curl_args_fn, handle_data_fn)
  -- Clear any existing autocommands in the specified group
  vim.api.nvim_clear_autocmds { group = group }

  -- Retrieve the prompt based on the provided options
  local prompt = get_prompt(opts)

  -- Ensure the system prompt is provided
  if not opts.system_prompt or opts.system_prompt == "" then
    vim.api.nvim_err_writeln("System prompt is missing")
    return
  end

  local system_prompt = opts.system_prompt

  -- Log the system prompt and user prompt for debugging
  nlog.log('system_prompt: ' .. system_prompt)
  nlog.log('prompt: ' .. prompt)

  -- Generate curl arguments using the provided function
  local args = make_curl_args_fn(opts, prompt, system_prompt)

  local curr_event_state = nil
  local output = {}

  -- Function to parse the output line and handle events/data
  local function parse_and_call(line)
    -- Check if the line contains an event and update the current event state
    local event = line:match '^event: (.+)$'
    if event then
      curr_event_state = event
      return
    end

    -- Check if the line contains data and process it accordingly
    local data_match = line:match '^data: (.+)$'
    if data_match then
      local content = handle_data_fn(data_match, curr_event_state)
      table.insert(output, content)
    end
  end

  -- Shutdown any active job before starting a new one
  if active_job then
    active_job:shutdown()
    active_job = nil
  end

  -- Create a new job to run the curl command
  active_job = Job:new {
    command = 'curl',
    args = args,
    on_stdout = function(_, out)
      parse_and_call(out)
    end,
    on_stderr = function(_, _) end,
    on_exit = function()
      active_job = nil
      nlog.log('LLM Output: ' .. table.concat(output, ''))
    end,
  }

  -- Start the job
  active_job:start()

  -- Create an autocommand to handle user escape action
  vim.api.nvim_create_autocmd('User', {
    group = group,
    pattern = 'THINGLLM_Escape',
    callback = function()
      if active_job then
        active_job:shutdown()
        print 'LLM streaming cancelled'
        active_job = nil
        nlog.log('LLM Output (cancelled): ' .. table.concat(output, ''))
      end
    end,
  })

  -- Set a keymap to trigger the escape autocommand
  vim.api.nvim_set_keymap('n', '<Esc>', ':doautocmd User THINGLLM_Escape<CR>', { noremap = true, silent = true })

  return active_job
end

return M
