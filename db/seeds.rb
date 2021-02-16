user = User.find_or_create_by(email: 'admin@example.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
end

30.times do
  Course.create!([{
                    title: Faker::Educator.course_name,
                    description: Faker::TvShows::GameOfThrones.quote,
                    user_id: user.id
                  }])
end