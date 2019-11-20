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

def find_artist_albums()
  sql = "SELECT * FROM album_list WHERE artist_id = $1"
  values = [@id]
  result = SqlRunner.run(sql, values)
  return result.map{|disk| Album.new(disk)}
end

def edit(new_name)
  sql = "UPDATE artist_list SET name = $1 WHERE id = $2"
  values = [new_name, @id]
  SqlRunner.run(sql, values)
end


def self.find_artist_by_id(id)
  sql = "SELECT * FROM artist_list WHERE id = $1"
  values = [id]
  result = SqlRunner.run(sql, values)
  return Artist.new(result[0])
end

def delete_artist()
  Album.delete_by_artist_id(@id)
  sql = "DELETE FROM artist_list WHERE id = $1"
  values =[@id]
  SqlRunner.run(sql, values)
end


end
