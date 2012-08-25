require 'rubygems'
require 'rake'

desc "Compile CoffeeScript, SCSS, and all of the above."
task :compile do
  sh "jekyll"
  sh "coffee -o js/compiled -c js/coffeescript/*.coffee"
  sh "sass css/scss/base.scss css/compiled/base.css --scss"
  sh "sass css/scss/iphone.scss css/compiled/iphone.css --scss"
end


#
# Watch tasks
#

task :jekyll do
  sh "jekyll --auto --server"
end

task :coffee do
  sh "coffee -o js/compiled -cw js/coffeescript/*.coffee"
end

task :compass do
  sh "compass watch"
end