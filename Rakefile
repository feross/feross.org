require 'rubygems'
require 'rake'

#
# Compile
#

desc "Compile everything"
task :compile do
  sh "jekyll"
  sh "coffee -o js/compiled -c js/coffeescript/*.coffee"
  sh "sass css/scss/base.scss css/compiled/base.css --scss"
  sh "sass css/scss/iphone.scss css/compiled/iphone.css --scss"
end


#
# Watch & continuously compile
#

desc "Watch-compile jekyll site"
task :jekyll do
  sh "jekyll --auto --server"
end

desc "Watch-compile coffeescript"
task :coffee do
  sh "coffee -o js/compiled -cw js/coffeescript/*.coffee"
end

desc "Watch-compile SCSS with Compass"
task :compass do
  sh "compass watch"
end


#
# Deploy
#

desc "Deploy site"
task :publish do
  sh "rsync -r -a -v -e \"ssh -l feross -p 44444\" --delete _site nginx.conf _server future:/home/feross/www/feross.org/"
end