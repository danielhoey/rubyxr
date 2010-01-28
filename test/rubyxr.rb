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
end

