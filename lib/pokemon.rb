class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def save
    sql = <<-SQL
    INSERT INTO pokemons (name, type)
    VALUES (?, ?)
    SQL

    DB[:conn].execute(sql, self.name, self.type)[0][0]
  end

end
