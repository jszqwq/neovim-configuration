local function check_class (line)
    local pattern_class = "^%[(.*)%]$"
    local class_name = string.match(line, pattern_class)
end

local function check_file_path (line)
    local pattern_file_path = "^%[.*%]%((.*)%)$"
    local file_path = string.match(line, pattern_file_path)
    return file_path
end


local function check_file_name (line)
    local pattern_file_name = "^%[(.*)%]%(.*%)$"
    local file_name = string.match(line, pattern_file_name)
    return file_name
end

return {
    check_class = check_class,
    check_file_name = check_file_name,
    check_file_path = check_file_path,
}
