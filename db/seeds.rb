# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call

# Environment variables (ENV['...']) can be set in the file .env file.

mentor = User.find_or_initialize_by!(email: 'mentor@email.com') do |user|
        user.name = 'Joe Mentor'
        user.password = 'password'
        user.password_confirmation = 'password'
        user.role = :mentor
        user.save!
end

mentee = User.find_or_initialize_by!(email: 'mentee@email.com') do |user|
        user.name = 'Bobby Mentee'
        user.password = 'password'
        user.password_confirmation = 'password'
        user.role = :mentee
        user.save!
end

# relationship = Relationship.find_or_create_by!(mentor: mentor, mentee: mentee)
relationship = Relationship.find_or_create_by!(mentor: mentor, mentee: mentee)

relationship.entries << Entry.new(text: 'first mentor entry', author: mentor)
relationship.entries << Entry.new(text: 'first mentee entry', author: mentee)
relationship.entries << Entry.new(text: 'second mentor entry', author: mentor)
relationship.entries << Entry.new(text: 'second mentee entry', author: mentee)
