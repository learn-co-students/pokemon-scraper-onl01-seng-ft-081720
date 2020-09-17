require 'pry'
class Pokemon
attr_accessor :name, :type, :db, :id

def initialize (id:,name:,type:,db:)
    @id=id
    @name=name
    @type=type
    @db=db
end

def self.save(name,type,db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
 
   db.execute(sql, name, type)
    @id =db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    
end

def self.find(id,db)
    sql= <<-SQL
        SELECT * FROM pokemon 
        WHERE id= ?
    SQL
    result=db.execute(sql,id)[0]
    # binding.pry
    new = Pokemon.new(id:id,name:result[1],type:result[2],db:db)
    new
end

end
