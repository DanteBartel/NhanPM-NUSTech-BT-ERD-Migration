# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.destroy_all
user01 = User.create(fname: "John", lname: "Lee", email: "jlee@example.com", pass: "jl123")
user02 = User.create(fname: "Adam", lname: "Bright", email: "adam_b@example.com", pass: "ab123")

Photo.destroy_all
photo01 = Photo.create(title: "photo 01", description: "this photo 01", photo: "photo01_link", user_id: 1)
photo02 = Photo.create(title: "photo 02", description: "this photo 02", photo: "photo02_link", user_id: 1)
photo03 = Photo.create(title: "photo 03", description: "this photo 03", photo: "photo03_link", user_id: 2)
photo04 = Photo.create(title: "photo 04", description: "this photo 04", photo: "photo04_link", user_id: 2)

Album.destroy_all
album01 = Album.create(title: "album 01", description: "this album 01", user_id: 1)
album02 = Album.create(title: "album 02", description: "this album 02", user_id: 1)
album03 = Album.create(title: "album 03", description: "this album 03", user_id: 2)
album04 = Album.create(title: "album 04", description: "this album 04", user_id: 2)









