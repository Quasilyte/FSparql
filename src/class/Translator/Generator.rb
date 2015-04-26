class Generator
  def initialize ast
    @ast = ast

    @select_cols = []
    @fetch_cols = []
    @opt_cols = []
    @filters = []

    @ast.each { |obj|
      obj.props.each { |prop|
        scan obj, prop
      }
    }

    generate_body
  end

  def generate_body
    @body = "SELECT #{@select_cols.join(', ')} {\n"
    @body << @fetch_cols.join("\n") << "\n"
    @body << "\tOPTIONAL {\n#{@opt_cols.join("\n")}\n\t}\n"
    @body << @filters.join("\n") << "\n}"
  end

  def scan obj, prop
    if prop.inc
      @select_cols << "?#{prop.sym}"
    end

    if prop.opt
      @opt_cols << "\t\t?#{obj.sym} #{prop.src} ?#{prop.sym}."
    elsif prop.sym == obj.sym
      @fetch_cols << "\t?#{obj.sym} a #{prop.src}."
    else
      @fetch_cols << "\t?#{obj.sym} #{prop.src} ?#{prop.sym}."
    end

    prop.filters.each { |filter|
      @filters << "\t#{filter.with_arg prop.sym}"
    }

  end

  def collect_inc_prop_names
    @ast.each { |obj|
      puts obj.inspect
    }
  end

  attr_reader :body
end