class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon(name, type)
            VALUES(?, ?);
        SQL
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT *
            FROM pokemon
            WHERE id = ?
            LIMIT 1
        SQL
        result = db.execute(sql, id)
        self.new(id: result[0][0], name: result[0][1], type: result[0][2], db: db)
    end
end
