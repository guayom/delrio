###
# Page options, layouts, aliases and proxies
###
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

#Pages for families
data.families.each do |family|
  proxy "/en/#{family.title['en'].parameterize}/index.html", "/family-template.html",
    :locals => {
      :family => family,
      :family_name => family.title['en'],
      :family_description => family.description['en'],
      :language => "en"
      }, :ignore => true
  proxy "/es/#{family.title['es'].parameterize}/index.html", "/family-template.html",
    :locals => {
      :family => family,
      :family_name => family.title['es'],
      :family_description => family.description['es'],
      :language => "es"
      }, :ignore => true
end

# General configuration
page "/backgroud.html", :layout => "content"

activate :i18n, :mount_at_root => false
activate :directory_indexes

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
