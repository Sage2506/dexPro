module DexPro
    class Endpoint
        def initialize
            @api = Api.new("https://pokeapi.co/api/v2/")
        end

        def all
            response = api.get(endpoint_name)
            count = response.dig(:count)
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
            api.get(endpoint_name, query: { offset: ( page - 1 ) * 20 , limit: limit })[:results]
        end

        def find(id)
            api.get("#{endpoint_name}/#{id}")
        end

        private

        attr_reader :api

        def endpoint_name
            @endpoint_name ||= self.class.name.split("::")[-1].downcase
        end
    end
end