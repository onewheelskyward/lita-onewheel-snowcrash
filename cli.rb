require 'marky_markov'

markov = MarkyMarkov::Dictionary.new('lib/dict/snowcrash') # Saves/opens dictionary.mmd
markov.parse_file 'lib/dict/snowcrash.txt'
puts markov.generate_n_words 10
puts markov.generate_n_sentences 2
markov.save_dictionary! # Saves the modified dictionary/creates one if it didn't exist.

trumpmarkov = MarkyMarkov::Dictionary.new('lib/dict/trump') # Saves/opens dictionary.mmd
trumpmarkov.parse_file 'lib/dict/trump.txt'
puts trumpmarkov.generate_n_words 10
puts trumpmarkov.generate_n_sentences 2
trumpmarkov.save_dictionary! # Saves the modified dictionary/creates one if it didn't exist.
