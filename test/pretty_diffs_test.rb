require 'test_helper'
require "meta_test_case"

class FakeTest < Minitest::Test
end

class PrettyDiffsTest < MetaTestCase

  def test_that_it_has_a_version_number
    refute_nil ::PrettyDiffs::VERSION
  end

  def test_run_test_with_pretty_diffs
    @tu =
    Class.new FakeTest do
      include PrettyDiffs

      def test_colored_diffs
        assert_equal "a" * 100, "b" * 100
      end
    end

    expected = clean <<-EOM
      F

      Finished in 0.00

        1) Failure:
      #<Class:0xXXX>#test_colored_diffs [FILE:LINE]:
      \e[0;31m\"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\"\e[0m\e[0;32m\"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb\"\e[0m


      1 runs, 1 assertions, 1 failures, 0 errors, 0 skips
    EOM

    assert_report expected
  end
end
