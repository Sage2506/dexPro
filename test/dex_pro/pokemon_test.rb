require "test_helper"

class DexProTest < Minitest::Test

    def test_fetch_all_pokemon
        VCR.use_cassette("all_pokemon") do
            result = DexPro::Pokemon.new.all
            assert_instance_of Array, result
        end
    end

    def test_fetch_pokemon_page
        VCR.use_cassette("pokemon_page_two") do
            result = DexPro::Pokemon.new.list(2)
            assert_instance_of Array, result
            assert_equal 20, result.size
            assert_equal "spearow", result[0][:name]
            assert_equal "wigglytuff", result[19][:name]
        end
    end

    def test_fetch_pokemon_by_id
        VCR.use_cassette("first_pokemon_by_id") do
            result =  DexPro::Pokemon.new.find(1)
            assert_instance_of Hash, result
            assert_equal "bulbasaur", result.dig(:name)
        end
    end
end