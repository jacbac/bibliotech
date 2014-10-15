def page_title
  title = "Bibliotech" #Set site title here

  if data.page.title
    title << " | " + data.page.title
  end

  title
end

def page_description
  description = "A static site for non-static documentation" # Set site description here

  if data.page.description
    description = data.page.description
  end

  description
end

def page_keywords
  keywords = ["bibliotech", "doc", "documentation"] # Set site keywords here

  if data.page.keywords
    keywords.concat(data.page.keywords)
  end

  keywords.uniq.join(", ")
end