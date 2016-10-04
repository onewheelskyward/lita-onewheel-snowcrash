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

      Markov = MarkyMarkov::Dictionary.new('dict/snowcrash')
      Markov.parse_file(File.expand_path('../../dict/snowcrash.txt',
        File.dirname(__FILE__)))

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

      def return_word_chain(number)
        Lita.logger.info "Generating #{number} words."
        log_and_return Markov.generate_n_words(number.to_i)
      end

      def return_sentence_chain(number)
        Lita.logger.info "Generating #{number} sentences."
        log_and_return Markov.generate_n_sentences(number.to_i)
      end

      def log_and_return(message)
        Lita.logger.info message
        message
      end

      Lita.register_handler(self)
    end
  end
end
