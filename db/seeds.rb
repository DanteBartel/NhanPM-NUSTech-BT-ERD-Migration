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
photo01 = Photo.create(title: "photo 01", description: "this photo 01", photo: "photo01_link")

Album.destroy_all
album01 = Album.create(title: "album 01", description: "this album 01")









