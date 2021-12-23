require "test_helper"

class DexProTest < Minitest::Test

    def test_fetch_all_berry
        VCR.use_cassette("all_berry") do
            result = DexPro::Berry.new.all
            assert_instance_of Array, result
        end
    end

    def test_fetch_berry_page
        VCR.use_cassette("berry_page_two") do
            result = DexPro::Berry.new.list(2)
            assert_instance_of Array, result
        end
    end

    def test_fetch_berry_by_id
        VCR.use_cassette("first_berry_by_id") do
            result =  DexPro::Berry.new.find(1)
            assert_instance_of Hash, result
        end
    end
end