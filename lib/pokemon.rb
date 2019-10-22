class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def save
    pikachu_from_db = @db.execute("SELECT * FROM pokemon WHERE name = 'Pikachu'")
  end


end
