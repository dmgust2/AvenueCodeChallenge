# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# TODO: Quick testing of tasks
Task.create! owner: "dmgust@gmail.com", public_viewable: true, name: "Watch football"
Task.create! owner: "dmgust@gmail.com", public_viewable: true, name: "Watch GOT"
Task.create! owner: "dmgust@gmail.com", public_viewable: false, name: "Play guitar!"
