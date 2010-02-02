require 'test/unit'
require 'fileutils'

module TestCaseCommon
  include FileUtils

  def setup
    @created_files = []
    @created_dirs = []
  end
  
  def teardown
    @created_files.each do |file| File.delete(file) end
    @created_dirs.each do |dir| rm_rf(dir) end
  end
  
protected
  def create_file(file_name, contents)
    file_name = "#{File.dirname(__FILE__)}/#{file_name}"
    @created_files << file_name
    File.open(file_name, 'w+') do |f| f << contents end
  end

  def create_dir(dir_name)
    dir_name = "#{File.dirname(__FILE__)}/#{dir_name}"
    @created_dirs << dir_name
    mkdir(dir_name)
  end
end
