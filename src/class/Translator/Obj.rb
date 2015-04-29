class Obj
  def initialize sym
    @sym = sym
    @parent = nil
    @props = []
  end

  def add_prop prop
    @props << prop
  end

  attr_reader :sym, :props
  attr_accessor :inc, :parent
end