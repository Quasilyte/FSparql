class Attr
  def initialize sym, dest
    @sym = sym
    @src = ''
    @dest = dest
  end

  def promote_to_obj
    master = Obj.new @sym
    master.add_prop self

    master
  end

  def with_sym sym
    "\t?#{sym} #{@src} ?#{@sym}."
  end

  attr_reader :sym
  attr_accessor :inc, :src, :dest
end