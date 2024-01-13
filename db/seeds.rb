# ユーザーの作成
users = []
5.times do |n|
  users << User.create!(
    email: "user#{n + 1}@example.com",
    password: 'password',
    name: "User#{n + 1}",
    user_name: "user#{n + 1}",
    thumbnail_path: '/path/to/thumbnail1.jpg',
    description: "Description for User #{n + 1}"
  )
end

# ポストの作成
posts = []
users.each do |user|
  3.times do
    posts << Post.create!(
      user: user,
      body: "デフォルト投稿",
      latitude: 35.6895,
      longitude: 139.6917
    )
  end
end

# コメントの作成
users.each do |user|
  posts.each do |post|
    1.times do
      Comment.create!(
        user: user,
        post: post,
        body: "デフォルトコメント"
      )
    end
  end
end
