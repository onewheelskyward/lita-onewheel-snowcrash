require 'marky_markov'

module Lita
  module Handlers
    class OnewheelSnowcrash < Handler
      route /^snowcrash$/i,
            :generate_random,
            command: true
      route /^snowcrash (\d+)$/i,
            :generate_by_number,
            command: true

      def generate_random(response)
        response.reply return_chain(Random::rand(20))
      end

      def generate_by_number(response)
        response.reply return_chain(response.matches[0][0])
      end

      def return_chain(number)
        puts "Generating #{number} words."
        markov = MarkyMarkov::Dictionary.new('dict/snowcrash') # Saves/opens dictionary.mmd
        markov.generate_n_words(number.to_i)
      end

      Lita.register_handler(self)
    end
  end
end
