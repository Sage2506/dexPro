require "test_helper"

class DexProTest < Minitest::Test
    def test_that_it_has_a_version_number
        refute_nil ::DexPro::VERSION
    end

    def test_fetch_first_character
        VCR.use_cassette("first_character_pokemon") do
            result =  DexPro.search_by_number(1)
            bulbasaur = {:name=>"bulbasaur"}
            assert_equal bulbasaur, result
        end
    end

    def test_fetch_first_ten
        VCR.use_cassette("first_ten_pokemon") do
            result = DexPro.getPage(1,10)
            assert_instance_of Hash, result
            assert_instance_of Array, result[:results]
            assert_equal 10, result[:results].count
        end
    end
end