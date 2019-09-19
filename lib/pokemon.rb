class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?, ?)
    SQL

    db.execute(sql, name, type)
    @id = db.execute('SELECT last_insert_rowid() FROM pokemon')[0][0]
  end

  def self.find(id, db)
     sql = "SELECT * FROM pokemon WHERE id = ?"
     db.execute(sql, id).map do |row|
       Pokemon.new(id: row[0], name: row[1], type: row[2], db: db)
     end.first
  end

end


# def self.save(name, type, db)
#   db.execute("INSERT INTO pokemon (name, type) VALUES (?,?);", name, type)
#   @id = db.execute('SELECT last_insert_rowid() FROM pokemon')[0][0]
# end
#
# def self.find(id, db)
#     row = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
#     Pokemon.new(id: row[0], name: row[1], type: row[2], db: db)
# end

  # def self.save(name, type, db)
  #   sql = <<-SQL
  #   INSERT INTO pokemon (name, type)
  #   VALUES (?, ?)
  #   SQL
  #
  #   db.execute(sql, name, type)
  #   @id = db.execute('SELECT last_insert_rowid() FROM pokemon')[0][0]
  # end

  # def self.find(id, db)
  #    sql = "SELECT * FROM pokemon WHERE id = ?"
  #    db.execute(sql, id).map do |row|
  #      Pokemon.new(id: row[0], name: row[1], type: row[2], db: db)
  #    end.first
  # end

end
