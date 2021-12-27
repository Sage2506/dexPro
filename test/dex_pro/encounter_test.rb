require "test_helper"

class DexProTest < Minitest::Test

    def test_fetch_all_encounter_method
        VCR.use_cassette("all_encounter_method") do
            result = DexPro::Encounter::EncounterMethod.new().all
            assert_instance_of Array, result
        end
    end

    def test_fetch_encounter_method_page
        VCR.use_cassette("encounter_method_page_two") do
            result = DexPro::Encounter::EncounterMethod.new().list(2)
            assert_instance_of Array, result
        end
    end

    def test_fetch_encounter_method_by_id
        VCR.use_cassette("first_encounter_method_by_id") do
            result =  DexPro::Encounter::EncounterMethod.new().find(1)
            assert_instance_of Hash, result
        end
    end
end