module Core
  include State

  def method_missing sym, *args
    sym = "#{@@obj_ref.sym}__#{sym}" unless @@obj_ref == nil

    if @@sym_table.has_key? sym
      @@prop_ref = @@sym_table[sym]
    else
      @@prop_ref = @@sym_table[sym] = Prop.new(sym)
    end
  end

  def kw_obj prop
    @@obj_def = true

    @@obj_arr << (@@obj_ref = prop.promote_to_obj)
  end

  def kw_prop sym
    abort "PROP (#{sym}) can not be used as top-level expression" if @@obj_ref == nil

    @@obj_ref.add_prop sym
  end

  def kw_inc src, filters = []
    @@prop_ref.src, @@prop_ref.filters = src, filters
  end

  def kw_if expr
    @@prop_ref.add_filter expr
  end

  def kw_exc src, filters = []
    @@prop_ref.inc, @@prop_ref.src, @@prop_ref.filters = false, src, filters
  end

  def kw_opt
    @@prop_ref.opt = true
  end

  def kw_val val, &block
    if @@obj_def
      @@obj_def = false

      abort "expected '{' after 'VAL #{val}'" if block.nil?
      block.call

      @@obj_ref = nil
    end

    val
  end
end