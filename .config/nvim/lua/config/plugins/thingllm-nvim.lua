-- Test
-- curl https://api.openai.com/v1/chat/completions -H "Content-Type: application/json" -H "Authorization: Bearer $OPENAI_API_KEY" -d '{
--   "model": "gpt-4-turbo",
--   "messages": [{"role": "user", "content": "Hello, world!"}],
--   "max_tokens": 5
-- }'

local code_prompt = [[
You should replace the code that you are sent, only following the comments.
Do not talk at all.
Only output valid code.
Do not provide any backticks that surround the code.
Never ever output backticks like this ```.
Any comment that is asking you for something should be removed after you satisfy them.
Other comments should left alone. Do not output backticks'
]]

local help_prompt = [[
You are a helpful assistant.
What I have sent are my notes so far.
You are very curt, yet helpful.
]]

-- The intention of this prompt to is to generate inline documentation for code. To make it well documented and easy to follow and understand.
local inline_documentation_prompt = [[
You are a inline documentation generator assistant.
Add comments to the code or text that will follow after the instructions.
RFC 2119 and 8174 keywords are used to indicate requirements.

Comment style:
- Comments should be clear and concise.
- Comments should indicate logical blocks of actions in code.
- Comments should document intent behind the code, and what the code is trying to achieve, from the developers perspective.
- Comments should not explain the code is doing at the code level.
- Comments should not explain any code that is self-explanatory or obvious. Functions with only a couple lines of code don't need comments beyond the docblock.
- Comments should use the most simple language reasonbily possible to explain the code.

Docblock style:
- Docblocks should be added to functions, classes, and variables that are not self-explanatory.
- Docblocks should include the description, parameters, return values, and throwables. In that order.
- Docblocks should have a short one line description. If the description is longer than one line, it should be split into a short and long description.
- Docblocks should have an empty line between the description and semantic sections if its common convention for the language.
- Docblocks should have an empty line between the short and long description if both are present.
- Docblocks should be in the most common and supported format for the language.

Instructions:
- SHOULD add comments to the code to explain the intent behind the code.
- SHOULD adjust formatting of the code to make it more readable, including adding empty lines between logical blocks.
- SHOULD NOT docment what the code is doing at the code level.
- MUST add the docblocks if they are missing.
- MUST output only the modified input.
- MUST NOT change the code logic.
- MUST NOT change the code structure.
- MUST NOT output any backticks for code blocks.
- MUST NOT output any commentry in your response that is not inline documentation.
- MUST NOT respond in markdown format.
- MUST NOT output ``` for code blocks.
- MUST NOT output ```lang for code blocks.
]]

local documentation_prompt_temperature = 0.2

return {
  enabled = true,
  'thingllm',
  dir = '~/.config/nvim/lua/local-plugins/thingllm/thingllm.lua',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local system_prompt = code_prompt
    local helpful_prompt = help_prompt

    local thingllm = require('local-plugins.thingllm.thingllm')

    -- local function groq_replace()
    --   thingllm.invoke_llm_and_stream_into_editor({
    --     url = 'https://api.groq.com/openai/v1/chat/completions',
    --     model = 'llama3.1-70b-versatile',
    --     api_key_name = 'GROQ_API_KEY',
    --     system_prompt = system_prompt,
    --     replace = true,
    --   }, thingllm.make_openai_spec_curl_args, thingllm.handle_openai_spec_data)
    -- end
    --
    -- local function groq_help()
    --   thingllm.invoke_llm_and_stream_into_editor({
    --     url = 'https://api.groq.com/openai/v1/chat/completions',
    --     model = 'llama3-70b-8192',
    --     api_key_name = 'GROQ_API_KEY',
    --     system_prompt = helpful_prompt,
    --     replace = false,
    --   }, thingllm.make_openai_spec_curl_args, thingllm.handle_openai_spec_data)
    -- end

    local function openai_replace()
      thingllm.invoke_llm_and_stream_into_editor({
          url = 'https://api.openai.com/v1/chat/completions',
          model = 'gpt-4o',
          api_key_name = 'OPENAI_API_KEY',
          system_prompt = system_prompt,
          replace = true,
          temperature = documentation_prompt_temperature,
        },
        thingllm.make_openai_spec_curl_args,
        thingllm.handle_openai_spec_data
      )
    end

    local function openai_help()
      thingllm.invoke_llm_and_stream_into_editor({
          url = 'https://api.openai.com/v1/chat/completions',
          model = 'gpt-4o',
          api_key_name = 'OPENAI_API_KEY',
          system_prompt = helpful_prompt,
          replace = false,
        },
        thingllm.make_openai_spec_curl_args,
        thingllm.handle_openai_spec_data
      )
    end

    local function openai_inline_documentation()
      thingllm.invoke_llm_and_stream_into_editor({
          url = 'https://api.openai.com/v1/chat/completions',
          model = 'gpt-4o',
          api_key_name = 'OPENAI_API_KEY',
          system_prompt = inline_documentation_prompt,
          replace = true,
        },
        thingllm.make_openai_spec_curl_args,
        thingllm.handle_openai_spec_data
      )
    end

    -- local function anthropic_help()
    --   thingllm.invoke_llm_and_stream_into_editor({
    --     url = 'https://api.anthropic.com/v1/messages',
    --     model = 'claude-3-5-sonnet-20240620',
    --     api_key_name = 'ANTHROPIC_API_KEY',
    --     system_prompt = helpful_prompt,
    --     replace = false,
    --   }, thingllm.make_anthropic_spec_curl_args, thingllm.handle_anthropic_spec_data)
    -- end
    --
    -- local function anthropic_replace()
    --   thingllm.invoke_llm_and_stream_into_editor({
    --     url = 'https://api.anthropic.com/v1/messages',
    --     model = 'claude-3-5-sonnet-20240620',
    --     api_key_name = 'ANTHROPIC_API_KEY',
    --     system_prompt = system_prompt,
    --     replace = true,
    --   }, thingllm.make_anthropic_spec_curl_args, thingllm.handle_anthropic_spec_data)
    -- end

    -- vim.keymap.set({ 'n', 'v' }, '<leader>k', groq_replace, { desc = 'llm groq' })
    -- vim.keymap.set({ 'n', 'v' }, '<leader>K', groq_help, { desc = 'llm groq_help' })
    vim.keymap.set({ 'n', 'v' }, '<leader>la', openai_help, { desc = 'llm openai_help' })
    vim.keymap.set({ 'n', 'v' }, '<leader>lr', openai_replace, { desc = 'llm openai_replace' })
    vim.keymap.set({ 'n', 'v' }, '<leader>ld', openai_inline_documentation, { desc = 'llm openai_inline_documentation' })
    -- vim.keymap.set({ 'n', 'v' }, '<leader>I', anthropic_help, { desc = 'llm anthropic_help' })
    -- vim.keymap.set({ 'n', 'v' }, '<leader>i', anthropic_replace, { desc = 'llm anthropic' })
  end,
}
