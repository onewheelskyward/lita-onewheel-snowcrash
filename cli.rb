require 'marky_markov'

markov = MarkyMarkov::Dictionary.new('dict/snowcrash') # Saves/opens dictionary.mmd
markov.parse_file 'dict/snowcrash.txt'
puts markov.generate_n_words 10
puts markov.generate_n_sentences 2
markov.save_dictionary! # Saves the modified dictionary/creates one if it didn't exist.
