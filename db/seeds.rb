# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

s = School.create(name: 'UC Berkeley', location: 'Berkeley, CA')
u = User.create(name: 'Stan Marsh', email: 'barrett_get_me_coffee@front_end_bitch.com')
p = Project.create(title: 'cet', description: 'ai squared...', creator_id:u.id)

s.projects << p
s.users << u

u.projects << p
u.school = s

p.user = u
p.school = s
