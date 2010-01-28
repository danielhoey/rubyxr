require 'test/test_case_common'

class Binary < Test::Unit::TestCase
  include TestCaseCommon
  
  def test_rubyxr_binary
    create_file('print_requirex_works.rb', 'puts "requirex works"')
    create_file('rubyxr_binary_test_file.rb', 'requirex "./print_requirex_works"')
    assert_equal('requirex works', `bin/rubyxr test/rubyxr_binary_test_file.rb`.strip)
  end
end
