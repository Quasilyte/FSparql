require './inc'

# translator = Translator.new
# translator.run './prg.query'

# preprocessor = Preprocessor.new './syntax.def'
# preprocessor.run './input.txt'

# translator = Translator.new
# translator.run './plang1.query'

# executor = Executor.new
# executor.run './sparql.txt'

# $map = {}

# def recur keyval, dim = $map
#   return if keyval[0].empty?
#   key = keyval[0][0]
#   keyval[0] = keyval[0][1..-1]

#   dim[key] = (keyval[0].length == 0 ? keyval[1] : {}) unless dim.has_key? key

#   recur keyval, dim[key]

# end

# arr = {
#   'lang__name' => 'Ruby',
#   'lang__year' => '1953',
#   'lang__author__name' => 'Yukihiro',
#   'lang__author__depiction' => 'URL'
# }

# arr.each { |elem|
#   elem[0] = elem[0].split '__'
#   recur elem
# }

# puts $map.inspect