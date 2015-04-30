class A
  def initialize a
    @a = a
  end
end

class B
  def initialize b
    @b = b
  end
end

flag = false

x = (flag ? A : B).new 555
puts x