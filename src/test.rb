require './inc'

# preprocessor = Preprocessor.new './syntax.def'
# preprocessor.run './input.txt'

# translator = Translator.new
# translator.run './plang1.query'

translator = Translator.new
translator.run './prg.query'

# puts 'INC PROP dbpedia-owl:ProgrammingLanguage'.gsub! /\b[A-Z]+\b/, '\0()'

# puts 'INC PROP dbpedia-owl:ProgrammingLanguage'.match(/(?:EXC|INC)\s+PROP\s+([\w\-:]+)/)[0]

# s = 'INC PROP dbpedia-owl:ProgrammingLanguage'
# s.gsub!(/(EXC|INC)\s+PROP\s+([\w\-:]+)/) { "#{$1} PROP '#{$2}'" }
# puts s
