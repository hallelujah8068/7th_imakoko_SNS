5.times do |n|
  User.create!(
    email: "user#{n + 1}@example.com",
    password: 'password',
    name: "User#{n + 1}",
    user_name: "user#{n + 1}",
    thumbnail_path: '/path/to/thumbnail1.jpg',
    description: "Description for User #{n + 1}"
  )
end


create_users = User.all


create_users.each do |user|
  5.times do
    Post.create!(
    user: user,
    body: "デフォルト投稿",
    latitude: 35.6895,  
    longitude: 139.6917  
    )
  end
end