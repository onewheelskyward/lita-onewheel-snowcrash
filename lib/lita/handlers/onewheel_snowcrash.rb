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
      route /^trump$/i,
            :generate_random_trump_sentence,
            command: true
      route /^trump (\d+)$/i,
            :generate_trump_by_number,
            command: true
      route /^trumpwords$/i,
            :generate_trump_random_words,
            command: true
      route /^trumpwords (\d+)$/i,
            :generate_trump_words_by_number,
            command: true

      Markov = MarkyMarkov::Dictionary.new('dict/snowcrash')
      Markov.parse_file(File.expand_path('../../dict/snowcrash.txt',
        File.dirname(__FILE__)))

      TrumpMarkov = MarkyMarkov::Dictionary.new('dict/trump')
      TrumpMarkov.parse_file(File.expand_path('../../dict/trump.txt',
        File.dirname(__FILE__)))

      def generate_random_sentence(response)
        sentence = Markov.generate_n_sentences(1)
        Lita.logger.info sentence
        response.reply sentence
      end

      def generate_by_number(response)
        sentences = Markov.generate_n_sentences(response.matches[0][0].to_i)
        Lita.logger.info sentences
        response.reply sentences
      end

      def generate_random_words(response)
        number = Random::rand(20)
        Lita.logger.info "Generating #{number} words."
        words = Markov.generate_n_words(number.to_i)
        Lita.logger.info words
        response.reply words
      end

      def generate_words_by_number(response)
        number = response.matches[0][0].to_i
        Lita.logger.info "Generating #{} words."
        words = Markov.generate_n_words(number.to_i)
        Lita.logger.info words
        response.reply words
      end

      def generate_random_trump_sentence(response)
        sentence = TrumpMarkov.generate_n_sentences(1)
        Lita.logger.info sentence
        response.reply sentence
      end

      def generate_trump_by_number(response)
        sentences = TrumpMarkov.generate_n_sentences(response.matches[0][0].to_i)
        Lita.logger.info sentences
        response.reply sentences
      end

      def generate_trump_random_words(response)
        number = Random::rand(20)
        Lita.logger.info "Generating #{number} words."
        words = TrumpMarkov.generate_n_words(number.to_i)
        Lita.logger.info words
        response.reply words
      end

      def generate_trump_words_by_number(response)
        number = response.matches[0][0].to_i
        Lita.logger.info "Generating #{} words."
        words = TrumpMarkov.generate_n_words(number.to_i)
        Lita.logger.info words
        response.reply words
      end

      Lita.register_handler(self)
    end
  end
end
