# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call

# Environment variables (ENV['...']) can be set in the file .env file.

mentor = User.where(email: 'mentor@email.com').first || User.new(email: 'mentor@email.com')
mentor.name = 'Joe Mentor'
mentor.password = 'password'
mentor.password_confirmation = 'password'
mentor.role = :mentor
mentor.save!

mentee = User.where(email: 'mentee@email.com').first || User.new(email: 'mentee@email.com')
mentee.name = 'Bobby Mentee'
mentee.password = 'password'
mentee.password_confirmation = 'password'
mentee.role = :mentee
mentee.save!

# relationship = Relationship.find_or_create_by!(mentor: mentor, mentee: mentee)
relationship = Relationship.find_or_create_by!(mentor: mentor, mentee: mentee)

relationship.entries << Entry.new(text: 'first mentor entry', author: mentor)
relationship.entries << Entry.new(text: 'first mentee entry', author: mentee)
relationship.entries << Entry.new(text: 'second mentor entry', author: mentor)
relationship.entries << Entry.new(text: 'second mentee entry', author: mentee)
