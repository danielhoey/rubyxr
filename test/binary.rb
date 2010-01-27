require 'test/unit'

class Test::Binary < Test::Unit::TestCase
  def test_rubyxr_binary
    create_file('print_requirex_works.rb', 'puts "requirex works"')
    create_file('rubyxr_binary_test_file.rb', 'requirex "./print_requirex_works"')
    assert_equal('requirex works', `bin/rubyxr test/rubyxr_binary_test_file.rb`.strip)
  end

  def teardown
    @created_files.each do |file|
      File.delete(file)
    end
  end
  
private
  def create_file(file_name, contents)
    @created_files ||= []
    
    file_name = "#{File.dirname(__FILE__)}/#{file_name}"
    @created_files << file_name
    File.open(file_name, 'w+') do |f| f << contents end
  end
end
