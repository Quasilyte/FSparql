class Prop
  def initialize sym
    @inc = true
    @opt = false
    @sym = sym
    @src = ''
    @filters = []
  end

  def promote_to_obj
    master = Obj.new @sym
    master.add_prop self

    master
  end

  def add_filter expr
    @filters << "#{expr.keys[0]}(?#{@sym})#{expr.values[0]}"
  end

  attr_reader :sym
  attr_accessor :inc, :opt, :src, :filters
end