require_relative "environment"

# Scraper.new(@db).scrape
#
# all_pokemon = @db.execute("SELECT * FROM pokemon;")

# test out your code here!
# def milo
#   @db = SQLite3::Database.new('../pokemon.db')
#   @db.execute("DROP TABLE IF EXISTS pokemon")
#   @sql_runner = SQLRunner.new(@db)
#   @sql_runner.execute_schema_migration_sql
#   Pokemon.new(id: 1, name: "Pikachu", type: "electric", db: @db)
#   Pokemon.save("Pikachu", "electric", @db)
#   loki = @db.execute("SELECT * FROM pokemon WHERE name = 'Pikachu'")
#   loki
# end
# answer to "milo" should be [[1, "Pikachu", "electric"]]




  # @db = SQLite3::Database.new('../pokemon.db')
  # @db.execute("DROP TABLE IF EXISTS pokemon")
  # @sql_runner = SQLRunner.new(@db)
  # @sql_runner.execute_schema_migration_sql
  # Pokemon.new(id: 1, name: "Pikachu", type: "electric", db: @db)
  # Pokemon.save("Pikachu", "electric", @db)
  # sql = "SELECT * FROM pokemon WHERE id = ? LIMIT 1"

  @db = SQLite3::Database.new('../pokemon.db')
  @db.execute("DROP TABLE IF EXISTS pokemon")
  @sql_runner = SQLRunner.new(@db)
  @sql_runner.execute_schema_migration_sql
  Pokemon.new(id: 1, name: "Pikachu", type: "electric", db: @db)
  Pokemon.save("Pikachu", "electric", @db)
     sql = "SELECT * FROM pokemon WHERE id = ? LIMIT 1"
     don = @db.execute(sql, 1).map do |row|
       row[0]
     end







# expect(pikachu_from_db.id).to eq(1)
# expect(pikachu_from_db.name).to eq("Pikachu")
# expect(pikachu_from_db.type).to eq("electric")

binding.pry
0
