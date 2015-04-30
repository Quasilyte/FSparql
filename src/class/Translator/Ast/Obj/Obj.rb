class Obj
  def initialize uri
    @uri = uri
  end

  def sym
    @uri
  end

  attr_reader :uri, :props
end