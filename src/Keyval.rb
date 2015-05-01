class Keyval
  def initialize keyval
    @keys = keyval[0].split '__'
    @val = keyval[1]
  end

  def k_empty?
    @keys.empty?
  end

  def k_length
    @keys.length
  end

  def k_shift
    @keys.shift
  end

  attr_reader :val
end