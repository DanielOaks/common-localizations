-- love2d game to show off the translation library
-- written by Daniel Oaks <daniel@danieloaks.net>, released into public domain

CommonLocal = require('commonlocal.commonlocal')
FbFonts = require('fbfonts.fbfonts')
trans = CommonLocal.new('en')

-- below function from http://stackoverflow.com/questions/656199/search-for-an-item-in-a-lua-list
function Set (list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end
-- below function from http://stackoverflow.com/questions/656199/search-for-an-item-in-a-lua-list
function table.find(f, l) -- find element v of l satisfying f(v)
    for _, v in ipairs(l) do
        if f == v then
            return _
        end
    end
    return nil
end
-- below function from http://stackoverflow.com/questions/2705793/how-to-get-number-of-entries-in-a-lua-table
function tablelength(T)
    local count = 0
    for _ in pairs(T) do
        count = count + 1
    end
    return count
end

function tableFindById(t, id)
    for _, v in ipairs(t) do
        if _ == id then
            return v
        end
    end
end

function love.load()
    currentLangId = table.find('en', trans.languageList)

    fonts = {'fonts/NotoSans-Regular.ttf', 'fonts/NotoSansCJK-Regular.ttc',
             'fonts/NotoNaskhArabic-Regular.ttf', 'fonts/NotoSansHebrew-Regular.ttf',
             'fonts/NotoSansDevanagari-Regular.ttf', 'fonts/NotoSansThai-Regular.ttf',
             'fonts/unifont-7.0.06.ttf'}

    FbFonts.setNewFonts(fonts, 30)
end

function love.draw()
    fontHeight = 40

    line = trans:get('lang', 'name.english')
    FbFonts.print(line, 20, 5)

    line = trans:get('menu', 'level.select')
    FbFonts.print(line, 5, 20 + fontHeight)

    line = trans:get('score', 'hiscore')
    FbFonts.print(line, 5, 20 + fontHeight * 2)

    line = trans:get('astro', 'Peg')
    FbFonts.print(line, 5, 20 + fontHeight * 3)

    line = trans:get('gameplay', 'jump')
    FbFonts.print(line, 5, 20 + fontHeight * 4)

    line = trans:get('app', 'version', '523')
    FbFonts.print(line, 5, 20 + fontHeight * 5)

    line = trans:get('sayings', 'clock')
    FbFonts.print(line, 5, 20 + fontHeight * 6)

    line = trans:get('astro', 'Equ')
    FbFonts.print(line, 5, 20 + fontHeight * 7)

    FbFonts.print('Left arrow for previous language', 5, love.graphics.getHeight() - 5 - fontHeight * 2)
    FbFonts.print('Right arrow for next language', 5, love.graphics.getHeight() - 5 - fontHeight)
end

function love.keypressed(key, isrepeat)
    if key == 'left' then
        -- previous language
        currentLangId = currentLangId - 1
        if currentLangId < 1 then
            currentLangId = tablelength(trans.languageList)
        end
        local currentLangString = tableFindById(trans.languageList, currentLangId)
        trans:setLanguage(currentLangString)
    elseif key == 'right' then
        -- next language
        currentLangId = currentLangId + 1
        if currentLangId > tablelength(trans.languageList) then
            currentLangId = 1
        end
        local currentLangString = tableFindById(trans.languageList, currentLangId)
        trans:setLanguage(currentLangString)
    else
        print(key, isrepeat)
    end
end
