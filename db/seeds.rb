# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: 'test@test.com', password:'111iti', nickname: 'テスト', lastname: '日本', firstname: '太郎', lastname_kana: 'ニホン', firstname_kana: 'タロウ', birth_date: '2019-7-9')