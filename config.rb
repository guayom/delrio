###
# Page options, layouts, aliases and proxies
###
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

#Pages for families
data.families.each do |family|
  proxy "/en/#{family.nombre_en.parameterize}/index.html", "/family-template.html",
    :locals => {
      :family => family,
      :family_name => family.nombre_en,
      :family_description => family.characteristics_en,
      :language => "en"
      }, :ignore => true
  proxy "/es/#{family.nombre_es.parameterize}/index.html", "/family-template.html",
    :locals => {
      :family => family,
      :family_name => family.nombre_es,
      :family_description => family.characteristics_es,
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
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
