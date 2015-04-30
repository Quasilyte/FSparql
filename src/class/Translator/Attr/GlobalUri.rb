class GlobalUri < Uri
  def push_to_dest obj_sym
    @dest << "\t?#{obj_sym} a #{@src}."
  end
end