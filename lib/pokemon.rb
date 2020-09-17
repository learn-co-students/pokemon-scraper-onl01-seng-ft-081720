# require 'sqlite3'
# DB = {:conn => SQLite3::Database.new("db/pokemon.db")}
require 'pry'
class Pokemon
    attr_accessor :name, :type
    attr_reader :id, :db

    def initialize(hash)
        @id = hash[:id]
        @name = hash[:name]
        @type = hash[:type]
        @db = hash[:db]
    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name,type) VALUES (?,?)"
        db.execute(sql, name, type)
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        array = db.execute(sql,id)[0]
        new_poke = Pokemon.new({id: array[0], name: array[1], type: array[2]})
    end
end
