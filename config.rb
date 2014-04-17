require "lib/blog_categories"
require "lib/blog_authors"
require "lib/breadcrumbs"
require "lib/override_date"
# require "better_errors"

######################################################################
# Blog settings
###

Time.zone = "Paris"

activate :blog do |blog|
  blog.default_extension = ".md"

  blog.prefix = "posts"
  blog.sources = "/:title.html"
  blog.permalink = "/:year/:title.html"

  # blog.layout = "layout"

  blog.taglink = "/tags/:tag.html"
  blog.tag_template = "templates/tag.html"

  blog.calendar_template = "templates/calendar.html"
  # blog.year_link = ":year.html"
  # blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"

  blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250

  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/:num"
end

activate :blog_categories do |categories|
  categories.category_template = "templates/category.html"
  categories.categorylink = "categories/:category.html"
end

activate :blog_authors do |authors|
  authors.author_template = "templates/author.html"
  authors.authorlink = "authors/:author.html"
end

# refactored breadcrumbs
activate :breadcrumbs

# pretty urls
activate :directory_indexes

# feed & rss
page "/feed.xml", :layout => false

######################################################################
# Assets directory
###

set :css_dir, 'assets/css'
set :js_dir, 'assets/js'
set :images_dir, 'assets/img'

######################################################################
# Markdown
###

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true,
              autolink: true,
              smartypants: true,
              gh_blockcode: true,
              lax_spacing: true,
              tables: true,
              with_toc_data: true

######################################################################
# Code highlighting
###

activate :rouge_syntax

######################################################################
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
# 
# With no layout
# page "/path/to/file.html", :layout => false
# 
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
# 
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

######################################################################
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

helpers do
  def table_of_contents(resource)
    content = File.read(resource.source_file)
    toc_renderer = Redcarpet::Render::HTML_TOC.new
    markdown = Redcarpet::Markdown.new(toc_renderer, nesting_level: 2) # nesting_level is optional
    markdown.render(content)
  end
end

######################################################################
# Build-specific configuration
###

configure :development do
  set :debug_assets, true
end

configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Create favicon/touch icon set from source/favicon_base.png
  activate :favicon_maker

  # Enable cache buster
  # activate :asset_hash

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
