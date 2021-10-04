# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

List.create!(
  [
    {
      title: 'ToDo',
      user_id: 1,
    },
    {
      title: 'in Progress',
      user_id: 1,
    },
    {
      title: 'Done',
      user_id: 1,
    },
    {
      title: 'Archive',
      user_id: 1,
    }
  ]
)
