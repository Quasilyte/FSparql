class Predicate
  def self.== rhs
    filter '=', rhs
  end

  def self.!= rhs
    filter '!=', rhs
  end

  def self.< rhs
    filter '<', rhs
  end

  def self.> rhs
    filter '>', rhs
  end

  def self.filter relation, rhs
    Filter.new self.name.upcase, relation, rhs
  end
end