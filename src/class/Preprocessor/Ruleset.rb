class Ruleset
  def initialize filename
    @rules = []

    (CfgReader.new filename).each_cfg_line { |cfg_line|
      @rules.push Rule.new cfg_line
    }
  end

  def each_rule
    @rules.each { |rule|
      yield rule
    }
  end
end