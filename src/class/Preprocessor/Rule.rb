class Rule < Inout
  def initialize cfg_line
    @in, @out = cfg_line.in, cfg_line.out
    @slots = []

    compilate
  end

  def apply raw_line
    raw_line.gsub(@in) { |line|
      if (vals = @in.match line)
        subst_vals_in vals, @out.dup
      else
        raw_line
      end
    }
  end

private

  def subst_vals_in vals, line
    vals[1..-1].each_with_index { |val, idx|
      line.gsub! @slots[idx], val
    }

    line
  end

  def compilate
    @in.gsub!(/\$[\w\-]+/) { |var|
      (idx = @slots.index var).nil? ? (ident var) : (backref idx)
    }

    @in = Regexp.new @in
  end

  def ident var
    @slots.push var
    '([\w\-]+)'
  end

  def backref idx
    "\\#{idx + 1}"
  end
end