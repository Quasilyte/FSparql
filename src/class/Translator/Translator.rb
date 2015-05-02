# Provides entry point for unit translation (Translator#run method).
class Translator
  include Agent
  include Core
  include Argv

  def initialize
    @generator = Generator.new
    parse_args
  end

  # Invoke translation on the text from the file.
  def run_s buf
    query_reset

    @buf = buf

    prepare_input
    eval_idsl

    @generator.run
  end

  def expand_val_stmt
    @buf.gsub!(/((?:EXC\s+|INC\s+)+)VAL\s+([\w\-:]+)(?:\s+(\[.*\]))?/) {
      $3.nil? ? "VAL(#{$1}'#{$2}')" : "VAL(#{$1}'#{$2}', #{$3})"
    }
  end

  def insert_semicolons
    @buf.gsub!(/\bOPT\b/) { "OPT;" }
    @buf.gsub!(/(OBJ|PROP)\s+([\w\-]+)/) { "#{$1} #{$2};" }
  end

  def escape_idsl_kws
    @buf.gsub!(/(@)?\b([A-Z]+)\b/) {
      $1.nil? ? "kw_#{$2.downcase}" : $2[0] + $2[1..-1].downcase
    }
  end

  # Make a valid idsl from the input buffer.
  def prepare_input
    expand_val_stmt
    insert_semicolons
    escape_idsl_kws

    if @@flags[:debug]
      puts @buf
    end
  end

  def eval_idsl
    eval @buf
  end
end