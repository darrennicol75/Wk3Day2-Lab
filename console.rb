require('pry')
require_relative('models/dream_home.rb')
DreamHome.delete_all()

home1 = DreamHome.new({
  'address' => '1 Brown Street',
  'value' => 150000,
  'number_of_bedrooms' => 3,
  'year_built' => 1980
  }
)

home2 = DreamHome.new({
  'address' => '3 Selbie Street',
  'value' => 170000,
  'number_of_bedrooms' => 4,
  'year_built' => 1990
  }
)

home1.save()
home2.save()
# home1.year_built = 1989
# home1.update()
# home1.delete()
#
# homes = DreamHome.all()

found_address = home2.find()

binding.pry
nil
