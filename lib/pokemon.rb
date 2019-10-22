class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS pokemons(
        id INTEGER PRIMARY KEY,
        name TEXT,
        type TEXT
        )
        SQL
      DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = <<-SQL
      DROP TABLE IF EXISTS pokemons
    SQL
    DB[:conn].execute(sql)
  end

  def save
    sql = <<-SQL
    INSERT INTO pokemons (name, type)
    VALUES (?, ?)
    SQL

    DB[:conn].execute(sql, self.name, self.type)

    @id = DB[:conn].execute("SELECT id FROM pokemons")[0][0]
  end

end
