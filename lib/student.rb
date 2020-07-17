require_relative "../config/environment.rb"

class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  
  attr_accessor :name, :grade, :id 
  
  def initialize(id=nil,name,grade)
    @id = id 
    @name = name 
    @grade = grade 
  end 
  
  def self.create_table
        sql = <<-SQL
      SELECT * 
      FROM students 
      WHERE grade = 10 
      ORDER BY students.id LIMIT 1 
    SQL

    DB[:conn].execute(sql).map do |row|
      self.new_from_db(row)
    end
    .first
  end


end
