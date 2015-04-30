module Core
  include State
  include Query

  def global_ctx
    @@sym_prefix.empty?
  end

  def method_missing sym, *args
    global_ctx ? sym : "#{@@sym_prefix}__#{sym}"
  end

  def kw_obj sym
    @@attr_ref = (global_ctx ? GlobalUri : NestedUri).new sym, @@fetch_cols
    @@sym_prefix = sym
  end

  def kw_prop sym
    @@attr_ref = Prop.new sym, @@fetch_cols

    abort "PROP (#{sym}) can not be used as top-level expression" if global_ctx
  end

  def collect_filters filters
    filters.each { |filter|
      @@filters << (filter.apply_to @@attr_ref.sym)
    }
  end

  def handle_excinc src, filters
    collect_filters filters

    @@attr_ref.src = src
  end

  def kw_inc src, filters = []
    handle_excinc src, filters

    @@inc_prop_syms << "?#{@@attr_ref.sym}"
  end

  def kw_exc src, filters = []
    handle_excinc src, filters
  end

  def kw_opt
    @@attr_ref.dest = @@opt_cols
  end

  def kw_val val, &block
    @@attr_ref.push_to_dest @@sym_prefix

    if @@attr_ref.uri?
      abort "expected '{' after 'VAL #{val}'" if block.nil?
      block.call

      @@sym_prefix = ''
    end
  end
end