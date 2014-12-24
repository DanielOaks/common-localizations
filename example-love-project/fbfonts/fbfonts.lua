-- Fallback Font Library
-- Code written by Daniel Oaks, this file is released into the public domain.


local FbFonts = {}
FbFonts.__index = FbFonts

-- hack to let us relative import libs in current folder
-- from http://stackoverflow.com/questions/9145432/load-lua-files-by-relative-path
local folderOfThisFile = (...):match('(.-)[^%.]+$')
local fsFolderOfThisFile = folderOfThisFile:gsub('%.', '/')

-- defaults
fontSize = 12
currentFonts = {}


function FbFonts.setNewFonts(fontList, fontSize)
    fontSize = fontSize or 12
    currentFonts = {}
    for i, filename in ipairs(fontList) do
        table.insert(currentFonts, love.graphics.newFont(filename, fontSize))
    end
end


function FbFonts.print(text, x, y)
    for i, font in ipairs(currentFonts) do
        if currentFonts[i]:hasGlyphs(text) then
            love.graphics.setFont(currentFonts[i])
            love.graphics.print(text, x, y)
            return
        end
    end
    -- failed to find an appropriate font
    love.graphics.setFont(currentFonts[1])
    love.graphics.print(text, x, y)

    print('** Failed to find font for text: ' .. text)
end


return FbFonts
