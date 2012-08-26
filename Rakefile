require 'rubygems'
require 'rake'

#
# Compile
#

desc "Compile everything"
task :compile do
  sh "coffee --compile --output js/compiled/ js/coffeescript/"
  sh "compass compile"
  sh "jekyll"
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
  sh "coffee --compile --watch --output js/compiled/ js/coffeescript/"
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
  Rake::Task["compile"].execute
  sh "rsync -r -a -v -e \"ssh -l feross -p 44444\" --delete _site nginx.conf _server future:/home/feross/www/feross.org/"
end