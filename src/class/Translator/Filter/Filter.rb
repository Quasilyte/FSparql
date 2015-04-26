class Filter
  def initialize fn, relation, rhs
    @fn, @relation, @rhs = fn, relation, rhs
  end

  def with_arg arg
    "FILTER(#{@fn}(?#{arg}) #{@relation} '#{@rhs}')"
  end
end