PANDOC_VERSION:must_be_at_least '2.17'


function tprint (t, s)
    for k, v in pairs(t) do
        local kfmt = '["' .. tostring(k) ..'"]'
        if type(k) ~= 'string' then
            kfmt = '[' .. k .. ']'
        end
        local vfmt = '"'.. tostring(v) ..'"'
        if type(v) == 'table' then
            tprint(v, (s or '')..kfmt)
        else
            if type(v) ~= 'string' then
                vfmt = tostring(v)
            end
            print(type(t)..(s or '')..kfmt..' = '..vfmt)
        end
    end
  end


local function summary (doc)
    local pos = doc.meta.pos
    --table.insert(doc.blocks, pos, pandoc.RawBlock('openxml', '<w:p><w:r><w:br w:type="page"/></w:r></w:p>'))
    --pos = pos + 1

    -- Title
    titulo = pandoc.Div(pandoc.Plain(pandoc.utils.stringify(doc.meta.title)))
    titulo["attr"]["attributes"]["custom-style"] = 'Title'
    table.insert(doc.blocks, pos, titulo)
    pos = pos + 1

    -- Subtitle
    subtitulo = pandoc.Div(pandoc.Plain(pandoc.utils.stringify(doc.meta.subtitle)))
    subtitulo["attr"]["attributes"]["custom-style"] = 'Subtitle'
    table.insert(doc.blocks, pos, subtitulo)
    pos = pos + 1

    -- Authors
    autores = pandoc.Div(table.concat(doc.meta.autor, ", "))
    autores["attr"]["attributes"]["custom-style"] = 'Authors2'
    table.insert(doc.blocks, pos, autores)
    pos = pos + 1

    -- Abstracts
    for _, s in pairs(doc.meta.resumen) do
        stitle = pandoc.Div(pandoc.Plain(pandoc.utils.stringify(s.title)))
        stitle["attr"]["attributes"]["custom-style"] = 'Abstract Title'
        table.insert(doc.blocks, pos, stitle)
        pos = pos + 1

        abstract = pandoc.Div(pandoc.Plain(pandoc.utils.stringify(s.content)))
        abstract["attr"]["attributes"]["custom-style"] = 'Abstract'
        table.insert(doc.blocks, pos, abstract)
        pos = pos + 1
        
        kwtitle = pandoc.utils.stringify(s.keywords[1].title)
        kws = pandoc.utils.stringify(s.keywords[1].content)
        table.insert(doc.blocks, pos, pandoc.Div(pandoc.Plain(kwtitle .. ': ' .. kws)))
        pos = pos + 1
    end
    table.insert(doc.blocks, pos, pandoc.RawBlock('openxml', '<w:p><w:r><w:br w:type="page"/></w:r></w:p>'))
    pos = pos + 1
    toc_title = pandoc.Div(pandoc.Plain("Contenido"))
    toc_title["attr"]["attributes"]["custom-style"] = 'TOC Heading'
    table.insert(doc.blocks, pos, toc_title)
    pos = pos + 1
    toc_text = pandoc.Div(pandoc.Plain("Inserta aquí el índice de contenidos"))
    table.insert(doc.blocks, pos, toc_text)
    pos = pos + 1
    toc_text2 = pandoc.Div(pandoc.Plain("Referencias > Tabla de contenidos > [Seleccionar una de las opciones]"))
    table.insert(doc.blocks, pos, toc_text2)
    pos = pos + 1
    table.insert(doc.blocks, pos, pandoc.RawBlock('openxml', "{TOC \\o '1-3'}"))
    pos = pos + 1
    table.insert(doc.blocks, pos, pandoc.RawBlock('openxml', '<w:p><w:r><w:br w:type="page"/></w:r></w:p>'))
    return doc
end

return {
  -- Apply the `summary` function to the main Pandoc document.
  { Pandoc = summary }
}