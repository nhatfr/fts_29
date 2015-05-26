10.times do |n|
  name = "Category #{n+1}"
  max_question = "30"
  max_time = "20"
  Category.create!(name: name, max_question: max_question, max_time: max_time)
end

User.create!(name: 'Administrator',
             email: 'admin@gmail.com',
             password: '12345678',
             password_confirmation: '12345678',
             level: 1,
             confirmation_token: "123456789",
             confirmed_at: Time.zone.now,
             confirmation_sent_at: Time.zone.now
)

User.create!(name: 'Normal',
             email: 'normal@gmail.com',
             password: '12345678',
             password_confirmation: '12345678',
             level: 0,
             confirmation_token: "123456789",
             confirmed_at: Time.zone.now,
             confirmation_sent_at: Time.zone.now
)
