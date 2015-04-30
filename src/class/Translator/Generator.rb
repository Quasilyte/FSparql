class Generator
  include Query
  include Argv

  def run
    generate_body
  end

private

  def select_clause
    "SELECT #{@@inc_prop_syms.join(', ')} {\n"
  end

  def fetch_cols_as_s
    @@fetch_cols.join("\n") << "\n"
  end

  def opt_cols_as_s
    opt_cols_s = ''
    @@opt_cols.each { |opt_col| opt_cols_s << "\t#{opt_col}\n" }

    "\tOPTIONAL {\n#{opt_cols_s}\t}\n"
  end

  def filters_as_s
    filters_s = ''
    @@filters.each { |filter| filters_s << "\t#{filter}\n" }

    "#{filters_s}}"
  end

  def append_limit
    if @@flags['limit']
      @body << "\nLIMIT #{@@flags['limit']}"
    end
  end

  def generate_body
    @body = select_clause
    @body << fetch_cols_as_s
    @body << opt_cols_as_s
    @body << filters_as_s

    append_limit
  end
end