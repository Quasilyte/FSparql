class NestedObj < Obj
  def initialize uri, parent
    super uri
    @parent = parent
  end

  def uri_sym
    @parent.uri
  end

  def props_into pool
    @props.each { |prop|
      puts "\t?#{@parent.sym} #{prop.src} ?#{prop.sym}."
    }
  end
end