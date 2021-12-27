require 'json'
require 'async'
require 'async/http/internet'

module DexPro
    class AsyncApi
        def initialize(base_url)
            @base_url = base_url
        end

        def get(path, **args)
            result = {}
            Async do
                internet = Async::HTTP::Internet.new
                response = internet.get(build_uri(path,**args))
                result = JSON.parse(response.read, symbolize_names: true)
            ensure
                internet.close
            end
            result
        end

        def get_url(path, **args)
            build_uri(path, **args)
        end

        private

        attr_reader :base_url

        def build_uri(path, **args)
            query_items = args.fetch(:query, {}).compact

            uri = URI.join(base_url, path)
            uri.query = URI.encode_www_form(query_items)
            uri.to_s
        end
    end
end