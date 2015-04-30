class Prop < Attr
  def uri?
    false
  end

  def push_to_dest obj_sym
    @dest << "\t?#{obj_sym} #{@src} ?#{@sym}."
  end
end