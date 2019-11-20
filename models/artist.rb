require_relative('../db/sql_runner')


class Artist
  attr_reader :id
  attr_accessor :name

def initialize(details)
  @id = details['id'].to_i() if details['id']
  @name = details['name']
end

def save()
  sql = "INSERT INTO artist_list (name) VALUES ($1) RETURNING id;"
  values = [@name]
  result = SqlRunner.run(sql, values)
  @id = result[0]['id'].to_i()
end

def self.delete_all()
  sql = "DELETE FROM artist_list"
  SqlRunner.run(sql)
end

def self.list_all()
  sql = "SELECT * FROM artist_list"
  result = SqlRunner.run(sql)
  return result.map{|artist| Artist.new(artist)}
end

end
