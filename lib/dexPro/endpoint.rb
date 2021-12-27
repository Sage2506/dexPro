module DexPro
    class Endpoint
        require 'async/barrier'
        def initialize
            @async_api = AsyncApi.new("https://pokeapi.co/api/v2/")
        end

        def all
            result_response = async_api.get(endpoint_name)
            count = result_response ? result_response[:count] : 0
            total_pages = count / 20
            if total_pages * 20 < count
                total_pages+= 1
            end
            if count > 20
                range = (2..total_pages)
                Async do
                    internet = Async::HTTP::Internet.new
                    barrier = Async::Barrier.new
                    # Spawn an asynchronous task for each topic:
                    range.each do |page|
                        barrier.async do
                            response = internet.get async_api.get_url(endpoint_name, query: { offset: ( page - 1 ) * 20 , limit: 20 })
                            result_response[:results].concat(JSON.parse(response.read, symbolize_names: true)[:results])
                        end
                    end
                    # Ensure we wait for all requests to complete before continuing:
                    barrier.wait
                ensure
                    internet&.close
                end
            end

            result_response[:results]
        end

        def list(page = 1, limit = 20)

            #async_api.get(endpoint_name, query: { offset: ( page - 1 ) * 20 , limit: limit })[:results]
            async_api.get(endpoint_name, query: { offset: ( page - 1 ) * 20 , limit: limit })[:results]
        end

        def find(id)
            async_api.get("#{endpoint_name}/#{id}")
        end

        private

        attr_reader :async_api

        def endpoint_name
            @endpoint_name ||= self.class.name.split("::")[-1].split(/(?=[A-Z])/).map(&:downcase).join('-')
        end
    end
end