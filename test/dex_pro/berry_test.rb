require "test_helper"

class DexProTest < Minitest::Test

    #------- Berries --------
    def test_fetch_all_berry
        VCR.use_cassette("all_berry") do
            result = DexPro::Berry.new().all
            assert_instance_of Array, result
        end
    end

    def test_fetch_berry_page
        VCR.use_cassette("berry_page_one") do
            result = DexPro::Berry.new().list(1)
            assert_instance_of Array, result
        end
    end

    def test_fetch_berry_by_id
        VCR.use_cassette("first_berry_by_id") do
            result =  DexPro::Berry.new().find(1)
            assert_instance_of Hash, result
        end
    end

    #------- Berries Firmness--------
    def test_fetch_all_berry_firmness
        VCR.use_cassette("all_berry_firmness") do
            result = DexPro::Berry::BerryFirmness.new().all
            assert_instance_of Array, result
        end
    end

    def test_fetch_berry_firmness_page
        VCR.use_cassette("berry_firmness_page_one") do
            result = DexPro::Berry::BerryFirmness.new().list(1)
            assert_instance_of Array, result
        end
    end

    def test_fetch_berry_firmness_by_id
        VCR.use_cassette("first_berry_firmness_by_id") do
            result =  DexPro::Berry::BerryFirmness.new().find(1)
            assert_instance_of Hash, result
        end
    end

    #------- Berries Flavors--------
    def test_fetch_all_berry_flavor
        VCR.use_cassette("all_berry_flavor") do
            result = DexPro::Berry::BerryFlavor.new().all
            assert_instance_of Array, result
        end
    end

    def test_fetch_berry_flavor_page
        VCR.use_cassette("berry_flavor_page_one") do
            result = DexPro::Berry::BerryFlavor.new().list(1)
            assert_instance_of Array, result
        end
    end

    def test_fetch_berry_flavor_by_id
        VCR.use_cassette("first_berry_flavor_by_id") do
            result =  DexPro::Berry::BerryFlavor.new().find(1)
            assert_instance_of Hash, result
        end
    end
end