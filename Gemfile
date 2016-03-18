source 'https://rubygems.org'

require 'json'
require 'open-uri'
versions = JSON.parse(open('https://pages.github.com/versions.json').read)

gem 'github-pages', versions['github-pages']
gem 'jekyll'
gem 'asciidoctor'
gem 'pygments.rb'

group :jekyll_plugins do
#  gem 'jekyll-asciidoc', '1.0.1.dev'
  gem 'jekyll-asciidoc'
end

#for nokogiri : sudo gem install nokogiri -- --with-xml2-include=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include/libxml2/ --use-system-libraries
#
#for rubygems:
#rvm install ruby 2.2.3
#rvm use ruby 2.2.3
#sudo gem install bundler
#bundle show jekyll-asciidoc => installer là le clone du repo à compiler (rake install)
#bundle install
