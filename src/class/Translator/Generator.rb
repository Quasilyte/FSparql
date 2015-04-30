class Generator
  include Query

  def initialize ast
    # @ast = ast

    # @select_cols = []
    # @fetch_cols = []
    # @opt_cols = []
    # @filters = []

    # puts @@fetch_cols.inspect
    # puts '-----'
    # puts @@inc_prop_refs.inspect
    # puts '-----'
    # puts @@opt_prop_refs.inspect
    # puts '-----'
    # puts @@filters.inspect

    # @@opt_cols.each { |prop|
    #   puts prop.inspect

    # }

    # @ast.each { |obj|
    #   obj.props.each { |prop|
    #     scan obj, prop
    #   }
    # }
    # parse_ast

    # puts @@fetch_cols
    generate_body
    puts @body
  end

  def generate_body
    @body = "SELECT #{@@inc_prop_syms.join(', ')} {\n"
    @body << @@fetch_cols.join("\n") << "\n"
    @body << "\tOPTIONAL {\n#{@@opt_cols.join("\n")}\n\t}\n"
    @body << @@filters.join("\n") << "\n}"
  end

  def scan obj, prop
    if prop.inc
      @select_cols << "?#{prop.sym}"
    end

    if prop.opt
      @opt_cols << "\t\t?#{obj.sym} #{prop.src} ?#{prop.sym}."
    elsif prop.sym == obj.sym
      # if obj.parent.nil?
      #   @fetch_cols << "\t?#{obj.sym} a #{prop.src}."
      # else
      #   @fetch_cols << "\t?#{obj.parent.sym} #{prop.src} ?#{prop.sym}."
      # end
    else
      @fetch_cols << "\t?#{obj.sym} #{prop.src} ?#{prop.sym}."
    end

    prop.filters.each { |filter|
      @filters << "\t#{filter.with_arg prop.sym}"
    }

  end

  def parse_ast
    @ast.each { |obj|
      scan_obj obj
    }
    # puts @fetch_cols.inspect
    @fetch_cols.each { |col|
      puts col.inspect
    }
  end

  def scan_obj obj
    obj.props.each { |prop|
      (prop.opt ? @opt_cols : @fetch_cols) << (obj.prop_stringify prop)
      prop.filters_into @filters
    }
  end

  def get_prop_pool prop
    prop.opt ? @opt_cols : @fetch_cols
  end

  attr_reader :body
end