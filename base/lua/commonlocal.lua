-- Common Localizations
-- Code written by Daniel Oaks, this file is released into the public domain.
-- The localizations are licensed under the MIT License, from http://goo.gl/fhnw1t
%%BASE_LANGUAGE_INFO%%

local CommonLocal = {}
CommonLocal.__index = CommonLocal

-- hack to let us relative import lib in current folder
-- from http://stackoverflow.com/questions/9145432/load-lua-files-by-relative-path
local folderOfThisFile = (...):match('(.-)[^%.]+$')
local folderLanguages = folderOfThisFile .. 'languages.'
local fsFolderOfThisFile = folderOfThisFile:gsub('%.', '/')


function CommonLocal.new(defaultLanguage)
    local self = setmetatable({}, CommonLocal)

    self.languageList = %%SUPPORTED_LANGUAGES%%
    self.defaultLanguage = defaultLanguage or 'en'
    self.currentLanguage = ''
    self.strings = {}

    self:setLanguage(self.defaultLanguage)

    return self
end

function CommonLocal:setLanguage(language)
    self.currentLanguage = language or self.defaultLanguage

    self.strings = require(folderLanguages .. self.currentLanguage)
end

function CommonLocal:get(section, key)
    line = self.strings[section][key]
    if line == '' or line == nil then
        return 'Translation Not Found'
    else
        return line
    end
    -- if self.strings[section] ~= nil then
    --     if self.strings[section][key] ~= nil then
    --         return self.strings[section][key]
    --     else
    --         return ''
    -- else
    --     return ''
    -- end
end

return CommonLocal
