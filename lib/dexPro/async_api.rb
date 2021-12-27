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
                # Make a new internet:
                internet = Async::HTTP::Internet.new
                # Issues a POST request:
                response = internet.get(build_uri(path,**args))
                # Save the response body to a local file:
                result = JSON.parse(response.read, symbolize_names: true)
            ensure
                # The internet is closed for business:
                internet.close
            end
            result
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