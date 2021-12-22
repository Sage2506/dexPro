# frozen_string_literal: true

require_relative "dexPro/version"
require 'json'
require 'net/http'
require_relative "dexPro/async_stream"
require_relative "dexPro/api"
require_relative "dexPro/endpoint"
require_relative "dexPro/pokemon"

module DexPro
    BASE_URL = 'https://pokeapi.co/api/v2/'.freeze

    class Error < StandardError; end
    # Your code goes here...
    def self.do_something
        'Hello World of Gems2'
    end

    def self.search_by_number( number = 0)
        res = Net::HTTP.get_response(URI("#{BASE_URL}pokemon/#{number}"))
        if res.is_a? Net::HTTPSuccess
            JSON.parse(res.body, {symbolize_names: true}).slice(:name)
        else
            nil
        end
    end

    def self.getPage( page = 1, limit = 25)
        res = Net::HTTP.get_response(URI("#{BASE_URL}pokemon?offset=#{ (page - 1) * limit}&limit=#{limit}"))
        if res.is_a? Net::HTTPSuccess
            JSON.parse(res.body, {symbolize_names: true})
        else
            nil
        end
    end

    def self.test_post
        uri = URI("http://www.example.com/todo.cgi")
        req =  Net::HTTP::Post.new(uri)
        req.set_form_data( 'from' => '2005-01-01', 'to' => '2005-03-31')
        req['Authorization'] = 'Bearer ACCESS-TOKEN'
        req['Accept'] = 'application/json'
        req['Content-Type'] = 'application/json'

        Net::HTTP.start(uri.hostname, uri.port) {|http|
                http.request(req)
            }
    end

    def self.test_delete(id = 0)
        res = Net::HTTP.new(BASE_URL).delete("#{id}")
        if res.is_a? Net::HTTPSuccess
            JSON.parse(res.body, {symbolize_names: true})
        else
            nil
        end
    end
end
