-- love2d game to show off the translation library
-- written by Daniel Oaks <daniel@danieloaks.net>, released into public domain

CommonLocal = require('commonlocal.commonlocal')
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
    currentLanguage = table.find('en', trans.languageList)
    setFont()
end

function love.draw()
    fontHeight = 40

    line = trans:get('lang', 'nameen')
    love.graphics.print(line, 20, 5)

    line = trans:get('menu', 'levelsd')
    love.graphics.print(line, 5, 20 + fontHeight)

    line = trans:get('score', 'hiscorece3')
    love.graphics.print(line, 5, 20 + fontHeight * 2)

    line = trans:get('astro', 'Peg')
    love.graphics.print(line, 5, 20 + fontHeight * 3)

    line = trans:get('gameplay', 'jump')
    love.graphics.print(line, 5, 20 + fontHeight * 4)

    line = trans:get('territory', 'HN')
    love.graphics.print(line, 5, 20 + fontHeight * 5)

    line = trans:get('territory', 'AU')
    love.graphics.print(line, 5, 20 + fontHeight * 6)

    line = trans:get('astro', 'Equ')
    love.graphics.print(line, 5, 20 + fontHeight * 7)

    love.graphics.print('Left arrow for previous language', 5, love.graphics.getHeight() - 5 - fontHeight * 2)
    love.graphics.print('Right arrow for next language', 5, love.graphics.getHeight() - 5 - fontHeight)
end

function love.keypressed(key, isrepeat)
    if key == 'left' then
        -- previous language
        currentLanguage = currentLanguage - 1
        if currentLanguage < 1 then
            currentLanguage = tablelength(trans.languageList)
        end
        local newLang = tableFindById(trans.languageList, currentLanguage)
        trans:setLanguage(newLang)
        setFont()
    elseif key == 'right' then
        -- next language
        currentLanguage = currentLanguage + 1
        if currentLanguage > tablelength(trans.languageList) then
            currentLanguage = 1
        end
        local newLang = tableFindById(trans.languageList, currentLanguage)
        trans:setLanguage(newLang)
        setFont()
    else
        print(key, isrepeat)
    end
end

function setFont()
    currentLangString = tableFindById(trans.languageList, currentLanguage)
    local NotoFonts = Set {'en', 'ja', 'zh', 'ko', 'ru', 'sv', 'pt_br', 'pt', 'nl', 'it', 'de', 'la', 'hu', 'fr', 'fi', 'es'}

    if NotoFonts[currentLangString] then
        love.graphics.setNewFont('fonts/NotoSansCJK-Regular.ttc', 30)
    
    else
        love.graphics.setNewFont('fonts/unifont-7.0.06.ttf', 30)
    end
end
