class Preprocessor
  include Agent

  def initialize filename
    @ruleset = Ruleset.new filename
  end

  def run_s buf
    apply_rules ((buf[-1] == ?\n) ? buf : buf << "\n")
  end

private

  def apply_rules buf
    @ruleset.each_rule { |rule|
      buf.gsub!(/.*\n/) { |raw_line|
        rule.apply raw_line
      }
    }

    buf
  end
end