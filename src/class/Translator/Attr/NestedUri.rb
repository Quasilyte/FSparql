class NestedUri < Uri
  def push_to_dest obj_sym
    @dest << "\t?#{obj_sym[0...(obj_sym.rindex /__.*/)]} #{@src} ?#{@sym}."
  end
end