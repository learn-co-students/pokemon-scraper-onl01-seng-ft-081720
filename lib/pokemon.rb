require 'pry'
class Pokemon
    attr_accessor :name, :type
    attr_reader :db, :id

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type 
        @db = db
    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        result =  db.execute(sql, id)[0]
        Pokemon.new(id: result[0], name: result[1], type: result[2], db: db)
    end 
end
