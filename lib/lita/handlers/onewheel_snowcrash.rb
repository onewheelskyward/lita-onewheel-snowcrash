require 'marky_markov'

module Lita
  module Handlers
    class OnewheelSnowcrash < Handler
      route /^snowcrash$/i,
            :generate_random_sentence,
            command: true
      route /^snowcrash (\d+)$/i,
            :generate_by_number,
            command: true
      route /^snowcrashwords$/i,
            :generate_random_words,
            command: true
      route /^snowcrashwords (\d+)$/i,
            :generate_words_by_number,
            command: true

      def generate_random_sentence(response)
        response.reply return_sentence_chain(1)
      end

      def generate_by_number(response)
        response.reply return_sentence_chain(response.matches[0][0])
      end

      def generate_random_words(response)
        response.reply return_word_chain(Random::rand(20))
      end

      def generate_words_by_number(response)
        response.reply return_word_chain(response.matches[0][0])
      end

      def get_markov
        puts File.join(File.dirname(File.expand_path(__FILE__)), '../../dict/snowcrash')
        # MarkyMarkov::Dictionary.new(File.join(File.dirname(File.expand_path(__FILE__)), 'dict/snowcrash'))
        MarkyMarkov::Dictionary.new('lib/dict/snowcrash')
      end

      def return_word_chain(number)
        Lita.logger.info "Generating #{number} words."
        markov = get_markov # Saves/opens dictionary.mmd
        words = markov.generate_n_words(number.to_i)
        Lita.logger.info words
        words
      end

      def return_sentence_chain(number)
        Lita.logger.info "Generating #{number} sentences."
        markov = get_markov # Saves/opens dictionary.mmd
        sentences = markov.generate_n_sentences(number.to_i)
        Lita.logger.info sentences
        sentences
      end

      Lita.register_handler(self)
    end
  end
end
