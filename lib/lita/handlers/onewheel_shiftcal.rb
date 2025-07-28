require 'rest-client'

module Lita
  module Handlers
    class OnewheelShiftcal < Handler
      route /^shift$/i,
            :get_day_results,
            command: true
      route /^shift (\w+)$/i,
            :get_search_results,
            command: true

      def get_search_results(response)
        res = RestClient.get("https://www.shift2bikes.org/api/search.php?q=#{term}")
        Lita.logger.debug res.body
        response.reply 'x'
      end

      Lita.register_handler(self)
    end
  end
end
