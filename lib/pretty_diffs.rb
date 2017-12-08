require "pretty_diffs/version"

module PrettyDiffs
  # RED      = '\033[0;31m'
  # GREEN    = '\033[0;32m'
  # NO_COLOR = '\033[0m'

  def self.included(base)
    base.class_eval do
      base.extend ClassMethods
      base.enforce_pretty_diffs
    end
  end

  module ClassMethods
    def enforce_pretty_diffs
      if verify_wdiff_in_path && !boring_diffs?
        enforce_color_diffs
      end
    end

    def enforce_color_diffs
      Minitest::Assertions.diff = "wdiff -n -w '\033[0;31m' -x '\033[0m' -y '\033[0;32m' -z '\033[0m'"
    end

    def verify_wdiff_in_path
      !%x{which wdiff}.empty?
    end

    def boring_diffs?
      ENV['MINITEST_PLAIN_BORING_DIFF'] == 'yes'
    end
  end
end
