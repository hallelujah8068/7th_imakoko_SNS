# ユーザーの作成
users = []

5.times do |n|
  user = User.create!(
    email: "user#{n + 1}_#{SecureRandom.hex(4)}@example.com",
    password: 'password',
    name: "User#{n + 1}",
    user_name: "user#{n + 1}",
    thumbnail_path: '/path/to/thumbnail1.jpg',
    description: "Description for User #{n + 1}"
  )
  users << user
end

# ユーザー2がフォローしているユーザーを3人作成
user2 = users[1] # ユーザー2を取得

# ユーザー2以外のユーザーからランダムに3人を選択してフォロー
following_users = users.reject { |user| user == user2 }.sample(3)

following_users.each do |following_user|
  Follow.create!(
    following: following_user,
    follower: user2
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