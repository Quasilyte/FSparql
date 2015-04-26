class Predicate
  def self.== rhs
    new_filter '=', rhs
  end

  def self.!= rhs
    new_filter '!=', rhs
  end

  def self.< rhs
    new_filter '<', rhs
  end

  def self.> rhs
    new_filter '>', rhs
  end

  def self.new_filter relation, rhs
    Filter.new self.name.upcase, relation, rhs
  end
end