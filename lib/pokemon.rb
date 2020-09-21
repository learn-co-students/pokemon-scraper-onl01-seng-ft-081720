class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        found = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        Pokemon.new(id: found[0], name: found[1], type: found[2], db: found[3])
    end
end
