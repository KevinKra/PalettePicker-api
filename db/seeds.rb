# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  user = User.new
  user.username = Faker::Name.name
  user.password = Faker::Coffee.variety

  user.save

  project = Project.new
  project.title = Faker::Lorem.sentence(word_count: 1)
  project.description = Faker::Lorem.sentence(word_count: 3)
  project.user_id = user.id
  
  project.save

  palette = Palette.new
  palette.title = Faker::Lorem.sentence(word_count: 2)
  palette.project_id = project.id

  palette.save

  color = Color.new
  color.hex_code = "#" + (Faker::Number.number(digits: 6)).to_s
  color.palette_id = palette.id

  color.save

  color_2 = Color.new
  color_2.hex_code = "#" + (Faker::Number.number(digits: 6)).to_s
  color.palette_id = palette.id

  color_2.save
end

