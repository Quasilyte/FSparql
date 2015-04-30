class GlobalObj < Obj
  def initialize uri
    super uri
  end

  def uri_sym
    @uri
  end

  def props_into pool
    @props.each { |prop|
      puts "\t?#{@sym} #{prop.src} ?#{prop.sym}."
    }
  end
end