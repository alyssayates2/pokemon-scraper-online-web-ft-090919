class Pokemon
  attr_accessor :name, :type, :db

  def initialize(name:, type:, db:)
    @name = name
    @type = type
    @db = db
  end

  def save
    sql = <<-SQL
    INSERT INTO pokemons (name, type, db)
    VALUES (?, ?, ?)
    SQL

    DB[:conn].execute(sql, self.name, self.type, self.db)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemons")[0][0][0]
  end

end
