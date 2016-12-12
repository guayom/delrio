###
# Page options, layouts, aliases and proxies
###
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page '/index.html', layout: false

# General configuration
page "/backgroud.html", :layout => "content"

activate :i18n, :mount_at_root => false, :langs => ['en', 'es']
activate :directory_indexes

#Pages for families
['en', 'es'].each do |locale|
  data.families.each do |family|
    proxy "/#{locale}/#{family.title[locale].parameterize}/index.html", "/family-template.html", locals: { family: family }, lang: locale, :ignore => true
  end
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
  def get_language
    @lang = current_page.path.split('/')
    @lang.first
  end
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
