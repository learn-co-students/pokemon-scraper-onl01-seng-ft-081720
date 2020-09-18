class Pokemon
    attr_accessor :name, :type, :db, :id

    def initialize(name:, type:, db:, id: nil)
        @name = name
        @type = type
        @db = db
        @id = id
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (? , ?)
        SQL
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT name, type, id
            FROM pokemon
            WHERE id = ?
            LIMIT 1
        SQL
        poke_array = db.execute(sql, id)[0]
        name = poke_array[0]
        type = poke_array[1]
        id = poke_array[2]
        self.new(name: name, type: type, db: db, id: id)
    end
end
