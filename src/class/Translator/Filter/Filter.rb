class Filter
  def initialize fn, relation, rhs
    @fn, @relation, @rhs = fn, relation, rhs
  end

  def apply_to sym
    "FILTER(#{@fn}(?#{sym}) #{@relation} '#{@rhs}')"
  end
end