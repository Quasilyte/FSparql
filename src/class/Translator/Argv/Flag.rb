class Flag
  def initialize key, rule = false
    @key = key
    @rule = rule
  end

  def hash_key keyval
    if @rule
      abort "#{@key} flag expects a value" if keyval[1] === true
      abort "invalid value for #{@key} flag given" unless keyval[1][@rule]
    end

    @key
  end
end