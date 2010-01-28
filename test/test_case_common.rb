require 'test/unit'

module TestCaseCommon
  def setup
    @created_files = []
  end
  
  def teardown
    @created_files.each do |file|
      File.delete(file)
    end
  end
  
private
  def create_file(file_name, contents)
    file_name = "#{File.dirname(__FILE__)}/#{file_name}"
    @created_files << file_name
    File.open(file_name, 'w+') do |f| f << contents end
  end
end
