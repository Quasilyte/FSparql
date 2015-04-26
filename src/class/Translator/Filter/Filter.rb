class Filter
  def initialize fn, relation, rhs
    @fn, @relation, @rhs = fn, relation, rhs
  end

  def with_arg arg
    "#{@fn}(#{arg})#{@relation}#{@rhs}"
  end
end