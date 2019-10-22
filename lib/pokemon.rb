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
        INSERT INTO pokemon (id, name, type, db)
        VALUES (?, ?, ?, ?)
        SQL

        DB[:conn].execute(sql, id,  name, type, db) 
   end

end
