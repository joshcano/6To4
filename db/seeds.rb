# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Post.destroy_all
users = %w[josh@example.com matt@example.com james@example.com kim@example.com]
images = Dir.glob("#{Rails.root}/avatars/stock_photos/*")
users.each do |user|
  new_user =  User.new(email: user, password: 'password', avatar: File.open(images[rand(images.length)] ))
  new_user.save!
  new_user.posts.create(title: BetterLorem.w(rand(4), true, true), body: BetterLorem.w(260, true, true), goal: '100', main_img: File.open("#{Rails.root}/avatars/stock_photos/new_biz.jpg"))
end

Post.all.each do |post|
  User.all.each do |user|
    post.transactions.create(amount: rand(33), user: user, comment: BetterLorem.w(rand(14), true, true)) unless user == post.user
  end
end

kim = User.find_by(email: 'kim@example.com')
kim.avatar = File.open("#{Rails.root}/avatars/stock_photos/kim.jpg")
kim.save
