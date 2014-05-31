# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file .env file.

User.find_or_create_by!(email: 'mentor@email.com') do |user|
        user.password = 'password'
        user.password_confirmation = 'password'
        user.role = :mentor
        user.save!
end

User.find_or_create_by!(email: 'mentee@email.com') do |user|
        user.password = 'password'
        user.password_confirmation = 'password'
        user.role = :mentee
        user.save!
end
