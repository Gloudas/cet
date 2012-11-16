# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

s = School.create(name: 'Berkeley', location: 'Berkeley, CA', uri: 'berkeley')
u = User.create(name: 'Stan Marsh', uid: 'barrett_get_me_coffee@front_end_bitch.com', email: 'barrett_get_me_coffee@front_end_bitch.com', school: s, admin: false)
p = Project.create(title: 'cet', description: 'ai squared...', creator: u)
u = User.create(name: 'Bro Bro', uid: 'breh@back_end_brogrammer.com', email: 'breh@back_end_brogrammer.com', school: s, admin: false)
p = Project.create(title: 'honk', description: 'im cool', creator: u)
u = User.create(name: "testAdmin", uid: 'testAdmin@berkeley.edu', email: "testAdmin@berkeley.edu", school: s, admin: true)
