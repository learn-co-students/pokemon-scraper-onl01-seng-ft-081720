class Pokemon
  
  attr_accessor :name, :type
  attr_reader :id, :db
  
  
 def initialize(id:,name:,type:,db:)
   @id = id 
   @name =name 
   @type = type 
   @db = db 
 end 
 
 def self.save(name,type,db)
  db.execute("INSERT INTO pokemon (name,type) VALUES (? , ?);", name,type)
  
 end 
 
 def self.find(id,db)
   new = db.execute( "SELECT * FROM pokemon WHERE id = ?;",id).flatten
     self.new(id:new[0], name:new[1], type:new[2], db: db)
end
   
end
