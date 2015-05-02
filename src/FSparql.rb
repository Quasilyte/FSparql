# A way to use default functionality.
# This can be used as an example to build some better interface.
# Warning: this script is useless without './inc.rb' included.
class FSparql
  def initialize syntax_cfg = './syntax.def'
    @agents = {
      #TODO: Preprocessor needs some ENV variable to locate syntax.def file.
      preprocessor: (Preprocessor.new syntax_cfg),
      translator: Translator.new,
      executor: Executor.new
    }

    @agent = nil
  end

  def set_agent agent_name
    abort 'invalid agent name given' unless @agents.key? agent_name
    @agent = @agents[agent_name]
  end

  # Agent could be useful if user wishes to handle input/output by his own.
  def get_agent agent_name
    @agents[agent_name]
  end

  def preprocessor
    @agents[:preprocessor]
  end

  def translator
    @agents[:translator]
  end

  def executor
    @agents[:executor]
  end

  def preprocessor_run opts = {}
    set_agent :preprocessor
    run_agent opts
  end

  def translator_run opts = {}
    set_agent :translator

    @agent.merge_flags opts[:flags] if opts.key? :flags

    run_agent opts
  end

  def executor_run opts = {}
    set_agent :executor
    run_agent opts
  end

  def run opts
    abort 'expected agent name in opts hash' unless opts.key? :agent
    set_agent opts[:agent]

    run_agent
  end

  def run_agent opts
    return file2file opts if [:i_filename, :o_filename].all? { |k| opts.key? k }
    return file2stdout opts if opts.key? :i_filename
    return stdin2file opts if opts.key? :o_filename
    return stdin2stdout
  end

  def stdin2stdout
    puts @agent.run_s STDIN.read
  end

  def stdin2file args
    IO.write (@agent.run_s STDIN.read), args[:o_filename]
  end

  def file2stdout args
    puts @agent.run_f args[:i_filename]
  end

  def file2file args
    IO.write args[:o_filename], (@agent.run_f args[:i_filename])
  end
end
