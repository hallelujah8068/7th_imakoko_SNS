
5.times do |n|
  user = User.create!(
    email: "user#{n + 1}_#{SecureRandom.hex(4)}@example.com",
    password: 'password',
    name: "User#{n + 1}",
    user_name: "user#{n + 1}",
    thumbnail_path: '/path/to/thumbnail1.jpg',
    description: "Description for User #{n + 1}"
  )
end

