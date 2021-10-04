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
      user_id: 5,
    },
    {
      title: 'in Progress',
      user_id: 5,
    },
    {
      title: 'Done',
      user_id: 5,
    },
    {
      title: 'Archive',
      user_id: 5,
    }
  ]
)

Card.create!(
  [
    {
      title: 'Reactを学ぶ',
      memo: '',
      list_id: 17,
    },
    {
      title: 'in Progress',
      memo: '',
      list_id: 18,
    },
    {
      title: 'Done',
      memo: '',
      list_id: 19,
    },
    {
      title: 'Rubyのクラスについて学ぶ',
      memo: '2h ドットインストール',
      list_id: 20,
    }
  ]
)