require './bootstrap'

preprocessor = Preprocessor.new './syntax.def'
preprocessor.run './input.txt'