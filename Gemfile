source 'https://rubygems.org'

require 'json'
require 'open-uri'
versions = JSON.parse(open('https://pages.github.com/versions.json').read)

gem 'github-pages', versions['github-pages']
gem 'jekyll'
gem 'asciidoctor'

group :jekyll_plugins do
  gem "jekyll-asciidoc"
end

gem 'html-proofer'
