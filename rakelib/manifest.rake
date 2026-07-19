# rakelib/manifest.rake

require 'fileutils'

namespace :manifest do
  desc "Provide manifest actions"
  task :sync

  desc "Clean staged manifest source files"
  task :clean
end
