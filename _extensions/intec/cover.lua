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


local function make_cover (doc)
  local pos = 1

  -- Degree
  degree = pandoc.Div('Para cumplir con parte de los requerimientos establecidos para obtener el título de ' .. pandoc.utils.stringify(doc.meta.degree))
  degree["attr"]["attributes"]["custom-style"] = 'Cover Text'
  table.insert(doc.blocks, pos, degree)
  pos = pos + 1

  -- Authors
  local autor_title = ''
  if #doc.meta.authors > 1 then
    autor_title = "Autores:"
  end
  if #doc.meta.authors == 1 then
    autor_title = "Autor:"
  end
  autor_title = pandoc.Div(pandoc.Plain(autor_title))
  autor_title["attr"]["attributes"]["custom-style"] = 'Cover Title'
  table.insert(doc.blocks, pos, autor_title)
  pos = pos + 1
  
  local authors = {}
  for _, as in pairs(doc.meta.authors) do
    local res = {}
    local id = as.id[1]
    res[#res + 1] = pandoc.utils.stringify(as.name.literal)
    table.insert(authors, res[#res])
    author_id = {'(ID: ', id.text, ')'}
    res[#res + 1] = pandoc.utils.stringify(author_id)
    autor = pandoc.Div(pandoc.Plain(table.concat(res, ' ')))
    autor["attr"]["attributes"]["custom-style"] = 'Cover Text'
    table.insert(doc.blocks, pos, autor)
    pos = pos + 1
  end

  -- Advisers
  local advisers_title = ''
  if #doc.meta.advisers > 1 then
    advisers_title = "Asesores:"
  end
  if #doc.meta.advisers == 1 then
    advisers_title = "Asesor:"
  end 
  advisers_title = pandoc.Div(pandoc.Plain(advisers_title))
  advisers_title["attr"]["attributes"]["custom-style"] = 'Cover Title'
  table.insert(doc.blocks, pos, advisers_title)
  pos = pos + 1


  local advisers = {}
  for _, as in pairs(doc.meta.advisers) do
    adviser = pandoc.Div(pandoc.utils.stringify(as))
    adviser["attr"]["attributes"]["custom-style"] = 'Cover Text'
    table.insert(doc.blocks, pos, adviser)
    table.insert(authors, pandoc.utils.stringify(as))
    pos = pos + 1
  end

  table.insert(doc.blocks, pos, pandoc.Str("\n"))
  pos = pos + 1

  -- Institution, Area and Program
  institution = pandoc.Div(pandoc.Str("Instituto Tecnológico de Santo Domingo"))
  institution["attr"]["attributes"]["custom-style"] = 'Cover Text'
  table.insert(doc.blocks, pos, institution)
  pos = pos + 1

  area = pandoc.Div(pandoc.utils.stringify(doc.meta.area))
  area["attr"]["attributes"]["custom-style"] = 'Cover Text'
  table.insert(doc.blocks, pos, area)
  pos = pos + 1

  program = pandoc.Div(pandoc.utils.stringify(doc.meta.program))
  program["attr"]["attributes"]["custom-style"] = 'Cover Text'
  table.insert(doc.blocks, pos, program)
  pos = pos + 1

  table.insert(doc.blocks, pos, pandoc.Str("\n"))
  pos = pos + 1
  
  -- City and Country
  city = pandoc.Div(pandoc.Str("Santo Domingo, RD"))
  city["attr"]["attributes"]["custom-style"] = 'Cover Right'
  table.insert(doc.blocks, pos, city)
  pos = pos + 1

  date = pandoc.Div(pandoc.utils.stringify(doc.meta.date))
  date["attr"]["attributes"]["custom-style"] = 'Cover Right'
  table.insert(doc.blocks, pos, date)
  pos = pos + 1

  table.insert(doc.blocks, pos, pandoc.RawBlock('openxml', '<w:p><w:r><w:br w:type="page"/></w:r></w:p>'))
  pos = pos + 1
  
  doc.meta.resumen = doc.meta.abstracts

  doc.meta.autor = authors
  doc.meta.author = nil
  doc.meta.date = nil
  doc.meta.abstract = nil
  doc.meta.toc = nil

  doc.meta.pos = pos

  return doc
end

return {
  -- Apply the `make_cover` function to the main Pandoc document.
  { Pandoc = make_cover }
}