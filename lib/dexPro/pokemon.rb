module DexPro
    class Pokemon < Endpoint

        def locationAreas(id)
            api.get("#{endpoint_name}/#{id}/encounters")
        end

        class Ability < Endpoint
        end

        class Characteristic < Endpoint
        end

        class Gender < Endpoint
        end

        class Nature < Endpoint
        end

        class Stat < Endpoint
        end

        class Type < Endpoint
        end

        class Characteristic < Endpoint
        end

        class EggGroup < Endpoint
        end

        class GrowthRate < Endpoint
        end

        class PokeathlonStat < Endpoint
        end

        class PokemonColor < Endpoint
        end

        class PokemonForm < Endpoint
        end

        class PokemonHabitat < Endpoint
        end

        class PokemonShape < Endpoint
        end

        class PokemonSpecies < Endpoint
        end
    end
end