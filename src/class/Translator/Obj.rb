class Obj
  def initialize sym
    @sym = sym
    @props = []
  end

  def add_prop prop
    @props << prop
  end

  attr_reader :sym, :props
  attr_accessor :inc
end