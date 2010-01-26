require 'test/unit'
require "#{File.dirname(__FILE__)}/../src/rubyxr"

class RubyxrTest < Test::Unit::TestCase
  def test_local_file
    # require a local file (ie: file in same directory)
    requirex './local_file'
    assert self.class.const_defined?(:LocalFile)
  end
end

