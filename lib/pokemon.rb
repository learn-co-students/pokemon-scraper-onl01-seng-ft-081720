class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
    end

    def self.find(id, db)
        pokemon_info = db.execute("SELECT *
            FROM pokemon
            WHERE id = ?",
            id).flatten
        pokemon = self.new(pokemon_info)
        pokemon.id = pokemon_info[0]
        pokemon.name = pokemon_info[1]
        pokemon.type = pokemon_info[2]
        pokemon
    end
end
