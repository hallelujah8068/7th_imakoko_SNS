# ユーザーの作成
users = []

30.times do |n|
  user = User.create!(
    email: Faker::Internet.email,
    password: 'password',
    name: Faker::Name.name,
    user_name: Faker::Internet.unique.username(specifier: 5..8),
    description: Faker::Lorem.sentence
  )
  users << user
end

# フォロー関係の作成
users.each do |user|
  # ユーザー自身を除いた他のユーザーからランダムに3人を選択
  following_users = users.reject { |u| u == user }.sample(3)

  following_users.each do |following_user|
    # フォロー関係を保存
    user.following << following_user
  end
end

# ポストの作成とコメントの作成
users.each do |user|
  5.times do
    post = Post.create!(
      user_id: user.id,
      body: Faker::Lorem.paragraph(sentence_count: 3),
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude
    )

    5.times do
      Comment.create!(
        user_id: users.sample.id,
        post_id: post.id,
        body: Faker::Lorem.sentence
      )
    end
  end
end
