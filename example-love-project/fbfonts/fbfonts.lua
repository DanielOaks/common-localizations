-- Fallback Font Library
-- Code written by Daniel Oaks, this file is released into the public domain.


local FbFonts = {}
FbFonts.__index = FbFonts

-- hack to let us relative import libs in current folder
-- from http://stackoverflow.com/questions/9145432/load-lua-files-by-relative-path
local folderOfThisFile = (...):match('(.-)[^%.]+$')
local fsFolderOfThisFile = folderOfThisFile:gsub('%.', '/')


-- font creation and setting
fontSize = 12
currentFonts = {}

function FbFonts.newFonts(newFontList, newFontSize)
    local newFontSize = newFontSize or 12
    local newFonts = {}
    for i, filename in ipairs(newFontList) do
        table.insert(newFonts, love.graphics.newFont(filename, newFontSize))
    end
    return newFonts
end


function FbFonts.setFonts(newFontList)
    currentFonts = newFontList
end


function FbFonts.setNewFonts(newFontList, newFontSize)
    local fonts = FbFonts.newFonts(newFontList, newFontSize)
    FbFonts.setFonts(fonts)
end


-- drawing functions
function FbFonts.setRightFontForString(text)
    for i, font in ipairs(currentFonts) do
        if currentFonts[i]:hasGlyphs(text) then
            -- found an appropriate font!
            love.graphics.setFont(currentFonts[i])
            return
        end
    end
    -- failed to find an appropriate font
    -- just use our default and exit
    love.graphics.setFont(currentFonts[1])
    print('** Failed to find font for text: ' .. text)
end


function FbFonts.print(text, x, y, r, sx, sy, ox, oy, kx, ky)
    FbFonts.setRightFontForString(text)
    love.graphics.print(text, x, y, r, sx, sy, ox, oy, kx, ky)
end


function FbFonts.printf(text, x, y, limit, align, r, sx, sy, ox, oy, kx, ky)
    FbFonts.setRightFontForString(text)
    love.graphics.printf(text, x, y, limit, align, r, sx, sy, ox, oy, kx, ky)
end

return FbFonts
