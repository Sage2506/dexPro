module DexPro
    class Endpoint
        def initialize
            @async_api = AsyncApi.new("https://pokeapi.co/api/v2/")
        end

        def all
            response = async_api.get(endpoint_name)
            count = response ? response[:count] : 0
            total_pages = count / 20
            if total_pages * 20 < count
                total_pages+= 1
            end
            if count > 20
                range = (2..total_pages)
                response[:results] + AsyncStream.new(range).sum do |page|
                    if page * 20 > count
                        list(page, count - (page - 1) * 20 )
                    else
                        list(page)
                    end
                end
            else
                response [:results]
            end
        end

        def list(page = 1, limit = 20)

            #async_api.get(endpoint_name, query: { offset: ( page - 1 ) * 20 , limit: limit })[:results]
            async_api.get(endpoint_name, query: { offset: ( page - 1 ) * 20 , limit: limit })[:results]
        end

        def find(id)
            async_api.get("#{endpoint_name}/#{id}")
        end

        private

        attr_reader :api
        attr_reader :async_api

        def endpoint_name
            @endpoint_name ||= self.class.name.split("::")[-1].split(/(?=[A-Z])/).map(&:downcase).join('-')
        end
    end
end