require "test_helper"

class DexProTest < Minitest::Test

    def test_fetch_all_contest_type
        VCR.use_cassette("contest_type_all") do
            result = DexPro::Contest::ContestType.new.all
            assert_instance_of Array, result
        end
    end

    def test_fetch_contest_type_page
        VCR.use_cassette("contest_type_page_one") do
            result = DexPro::Contest::ContestType.new.list(1)
            assert_instance_of Array, result
        end
    end

    def test_fetch_contest_type_by_id
        VCR.use_cassette("contest_type_first_by_id") do
            result =  DexPro::Contest::ContestType.new.find(1)
            assert_instance_of Hash, result
        end
    end
end