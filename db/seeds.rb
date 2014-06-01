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
mentor.avatar_name = 'avatar1.png'
mentor.save!

mentee = User.where(email: 'mentee@email.com').first || User.new(email: 'mentee@email.com')
mentee.name = 'Bobby Mentee'
mentee.password = 'password'
mentee.password_confirmation = 'password'
mentee.role = :mentee
mentee.avatar_name = 'avatar2.png'
mentee.save!

mentee2 = User.where(email: 'mentee2@email.com').first || User.new(email: 'mentee2@email.com')
mentee2.name = 'Frank Mentee'
mentee2.password = 'password'
mentee2.password_confirmation = 'password'
mentee2.role = :mentee
mentee2.avatar_name = 'avatar3.png'
mentee2.save!

relationship1 = Relationship.find_or_create_by!(mentor: mentor, mentee: mentee)
relationship2 = Relationship.find_or_create_by!(mentor: mentor, mentee: mentee2)

entry1 = Entry.new(author: mentee, entry_type: 'emoticon', emoticon: 'sad', text: "I'm not feeling great. What are you up to?", created_at: Date.today - 2)
entry1.comments << Comment.new(author: mentor, text: "What's going on?")
entry1.comments << Comment.new(author: mentee, text: "I got bullied at school today by my classmates.")
entry1.comments << Comment.new(author: mentor, text: "That sucks! I know how you feel, shall we talk about this in our next session?")

entry2 = Entry.new(author: mentee, entry_type: 'question', question: "What's been making you smile lately?!", text: "That boy I liked, said hello to me today!", created_at: Date.today - 1)
entry2.comments << Comment.new(author: mentor, text: "That's great!")
entry2.comments << Comment.new(author: mentor, text: "The thing that made me smile this week is that my partner surprised me with a dinner.")
entry2.comments << Comment.new(author: mentee, text: "Aw so happy for you!")

entry3 = Entry.new(author: mentee, entry_type: 'question', question: "How did you deal with people calling you names at school?", text: "I got punched in a corner today and yelled at and feel wrecked! Don't know how to handle this situations!")

relationship1.entries << entry1
relationship1.entries << entry2
relationship1.entries << entry3
