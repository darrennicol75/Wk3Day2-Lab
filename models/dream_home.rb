require('pg')

class DreamHome

attr_accessor :address, :value, :number_of_bedrooms, :year_built

  def initialize(criteria)
    @id = criteria['id'].to_i if criteria['id']
    @address = criteria['address']
    @value = criteria['value'].to_i()
    @number_of_bedrooms = criteria['number_of_bedrooms'].to_i()
    @year_built = criteria['year_built'].to_i()
  end

  def save()
    db = PG.connect({
      dbname: 'dream_properties',
      host: 'localhost'
      })
    sql = "INSERT INTO dream_homes(
    address, value, number_of_bedrooms, year_built
    )
    VALUES ($1, $2, $3, $4) RETURNING *"
    values = [@address, @value, @number_of_bedrooms, @year_built]
    db.prepare("save",sql)
    results = db.exec_prepared("save",values)
    @id = results[0]['id'].to_i()
    db.close()
  end

  def update()
    db = PG.connect({
      dbname: 'dream_properties',
      host: 'localhost'})
    sql = "UPDATE dream_homes SET (address, value, number_of_bedrooms, year_built) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@address, @value, @number_of_bedrooms, @year_built, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def delete()
    db =PG.connect({
      dbname: 'dream_properties',
      host: 'localhost'
      })
    sql = "DELETE FROM dream_homes WHERE id = $1"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close()
  end

  def find()
    db =PG.connect({
      dbname: 'dream_properties',
      host: 'localhost'
      })
    sql = "SELECT * FROM dream_homes WHERE id = $1"
    values = [@id]
    db.prepare("find", sql)
    found = db.exec_prepared("find", values)
    db.close()
    return found.map{|look| DreamHome.new(look)}
  end

  def find()
    db =PG.connect({
      dbname: 'dream_properties',
      host: 'localhost'
      })
    sql = "SELECT * FROM dream_homes WHERE address = $1"
    values = [@address]
    db.prepare("find", sql)
    found_address = db.exec_prepared("find", values)
    db.close()
    return found_address.map{|look| DreamHome.new(look)}
  end

  def DreamHome.delete_all()
    db = PG.connect({
      dbname: 'dream_properties',
      host: 'localhost'})
    sql = "DELETE FROM dream_homes"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close()
  end


  def DreamHome.all()
    db = PG.connect({
      dbname: 'dream_properties',
      host: 'localhost'})
    sql = "SELECT * FROM dream_homes"
    db.prepare("all", sql)
    homes = db.exec_prepared("all")
    db.close()
    return homes.map{|home| DreamHome.new(home)}

  end

end
