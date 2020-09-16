
require 'pry'

class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @name = name
        @type = type
        @id = id
        @db = db
       
        
    end

    def self.save(name, type, db)
        sql= <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
        
        
    end

    def self.find(id, db)
        sql = <<-SQL
          SELECT *
          FROM pokemon
          WHERE id = (?)
        SQL
        pokemon = db.execute(sql, id).first
        Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)

    end


    # def self.find(id, db)
    #     sql= <<-SQL
    #         SELECT *
    #         FROM pokemon
    #         WHERE id = ?
    #     SQL
        
    #     row = db.execute(sql, id)
       

    #     Pokemon.new(row.first[0], row.first[1], row.first[2], db)
    #     # binding.pry
    # end


end
# require 'pry'
# require_relative "../config/environment.rb"

# class Student
# attr_accessor :id, :name, :type

# def initialize(id=nil, name, grade)
# @id = id
# @name = name
# @grade = grade
# end


# #THIS IS SAVING IT INTO THE DATABASE AS A ROW
# def save
#   if self.id
#     self.update
#   else
#     sql= <<-SQL
#       INSERT INTO students (name, grade)
#       VALUES (?, ?)
#     SQL
#     DB[:conn].execute(sql, self.name, self.grade)
#     @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
#   end

# end
   
# def self.new_from_db(row)
  
#   new_student_obj = Student.new(row[0], row[1], row[2])
#   new_student_obj
# end

# def self.find_by_name(name)
#   sql= <<-SQL
#   SELECT *
#   FROM students
#   WHERE name= ?
#   SQL

#   DB[:conn].execute(sql, name).map do |row|
#     # Student.create(row [1], row[2])
#     Student.new_from_db(row)
#   end.first
  
# end



# def update
#   sql= <<-SQL
#   UPDATE students
#   SET name = ?, grade = ?
#   WHERE id = ?
#   SQL

#   DB[:conn].execute(sql, self.name, self.grade, self.id)
# end


# def self.create(name, grade)
#   new_student_record = Student.new(name, grade)
#   new_student_record.save
#   new_student_record
# end


# def self.create_table

#   sql = <<-SQL
#   CREATE TABLE IF NOT EXISTS students (
#     id INTEGER PRIMARY KEY,
#     name TEXT,
#     grade TEXT
#     )
#     SQL
  
#   DB[:conn].execute(sql)
# end

# def self.drop_table
#   sql= <<-SQL
#   DROP TABLE students
#   SQL
#   DB[:conn].execute(sql)
# end


#   # Remember, you can access your database connection anywhere in this class
#   #  with DB[:conn]




# end

  