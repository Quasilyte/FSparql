class Attr
  def initialize sym, dest
    @sym = sym
    @src = ''
    @dest = dest
  end

  attr_reader :sym
  attr_accessor :src, :dest
end