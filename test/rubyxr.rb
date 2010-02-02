require 'test/test_case_common'
require "#{File.dirname(__FILE__)}/../src/rubyxr"

class RubyxrTest < Test::Unit::TestCase
  include TestCaseCommon
  
  def test_local_file
    # require a local file (ie: file in same directory)
    create_file('local_file.rb', 'class LocalFile; end')
    requirex './local_file'
    assert Object.const_defined?(:LocalFile)
  end
  
  def test_relative_file
    create_file('../relative_file.rb', 'class RelativeFile; end')
    requirex '../relative_file'
    assert Object.const_defined?(:RelativeFile)
  end

  def test_path_from_project_root
    create_dir('temp')
    create_file('.rubyxr', '')
    create_file('./local_file.rb', 'class LocalFile; end')
    create_file('temp/temp_file.rb', 'requirex "local_file"')
    requirex './temp/temp_file'
    assert Object.const_defined?(:LocalFile)
  end
end

