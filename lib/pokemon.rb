class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(id, name, type)
    sql = <<-SQL
        INSERT INTO pokemon (id, name, type)
        VALUES (?, ?, ?)
        SQL

        :db.execute(sql, self.id, self.name, self.type)
  end


end
