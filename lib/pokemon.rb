class Pokemon
  attr_accessor :id, :name, :type

  def self.initialize(id, name, type)
    @id = id
    @name = name
    @type = type
  end

end
