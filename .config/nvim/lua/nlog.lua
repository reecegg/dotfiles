-- In lua/nlog.lua
local M = {}

local log_file_path = "/tmp/neovim.log"
local write_queue = {}
local writing = false

-- Write the next line in the write queue to the log file
local function write_next()
  -- If the write queue is empty, stop writing
    if #write_queue == 0 then
        writing = false
        return
    end

    -- Get a line from the write queue
    local line = table.remove(write_queue, 1)


    -- Open the log file for writing (then write the line, close the file, and repeat)
    vim.loop.fs_open(log_file_path, "a", 438, function(open_err, fd)
        if open_err then
            print("Error: Unable to open log file for writing.")
            writing = false
            return
        end

        -- Write the line to the log file
        vim.loop.fs_write(fd, line .. "\n", -1, function(write_err)
            if write_err then
                print("Error: Unable to write to log file.")
            end

            -- Close the log file after writing
            vim.loop.fs_close(fd, function(close_err)
                if close_err then
                    print("Error: Unable to close log file.")
                end

                -- Write the next line in the write queue
                write_next()
            end)
        end)
    end)
end

-- Log a line to the log file
function M.log(line)
    table.insert(write_queue, line)
    if not writing then
        writing = true
        write_next()
    end
end

-- Log the call stack to the log file
function M.log_stack()
    local stack = debug.traceback("", 2)  -- Get the call stack, excluding the `log_stack` function
    local filtered_stack = stack:gsub("(.-\n)[^\n]+%s*in function 'log_stack'\n", "%1")  -- Remove the `log_stack` function entry
    M.log(filtered_stack)
end

-- Print an message to the command area
function M.print(message)
    vim.api.nvim_echo({{message, "Normal"}}, true, {})
end


-- Print a message to the command area and log it
function M.print_and_log(message)
    M.print(message)
    M.log(message)
end

-- Print an error message to the command area
function M.print_error(message)
    vim.api.nvim_echo({{message, "ErrorMsg"}}, true, {})
end

-- Print an error message to the command area and log its
function M.print_error_and_log(message)
    M.print_error(message)
    M.log(message)
end

return M
