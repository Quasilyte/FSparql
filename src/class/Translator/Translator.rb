class Translator
  include Core

  def run filename
    @buf = IO.read filename

    prepare_input
    eval_idsl

    puts (Generator.new @@ast).body
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

  def prepare_input
    expand_val_stmt
    insert_semicolons
    escape_idsl_kws

    puts @buf
    puts '-----------------------------'
  end

  def eval_idsl
    eval @buf

    puts "------------"
    # puts @@sym_table.inspect
    # Generator.run
    # dump
  end

  def dump
    @@ast.each { |obj|
      puts "'#{obj.sym}': {"
      obj.props.each { |prop|
        puts "\t'#{prop.sym}': {"
        puts "\t\t'inc': #{prop.inc}"
        puts "\t\t'src': #{prop.src}"
        puts "\t\t'opt': #{prop.opt}"
        prop.filters.each { |f|
          puts "\t\t[#{f.with_arg prop.sym}]"
        }
        puts "\t}"
      }
      puts '}'
    }
    # puts @@obj_arr.inspect
  end
end