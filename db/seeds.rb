# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Post.destroy_all
users = %w[josh@example.com matt@example.com james@example.com]
users.each do |user|
  new_user =  User.new(email: user, password: 'password')
  new_user.save!
  new_user.posts.create(title: 'test title', body: 'test body', goal: '100')
end

Post.all.each do |post|
  User.all.each do |user|
    post.transactions.create(amount: rand(33), user: user) unless user == post.user
  end
end
