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
    CREATE TABLE IF NOT EXISTS pokemons (
      id INTEGER PRIMARY KEY,
      name TEXT,
      type INTEGER
    )
    SQL

    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = "DROP TABLE IF EXISTS pokemons"
      DB[:conn].execute(sql)
  end

  def save
     if self.id
       self.update
     else
       sql = <<-SQL
       INSERT INTO pokemons (name, type)
       VALUES (?, ?)
       SQL

       DB[:conn].execute(sql, self.name, self.type)
       @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemons")[0][0]
      end
    end

    def update
      sql = "UPDATE pokemons SET name = ?, type = ? WHERE id = ?"
      DB[:conn].execute(sql, self.name, self.type, self.id)
    end

    def self.create(name, type)
      pokemon = Pokemon.new(name, type)
      pokemon.save
      pokemon
    end

end
