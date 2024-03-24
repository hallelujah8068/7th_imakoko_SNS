# ユーザーの作成
users = []

30.times do |n|
  user = User.create!(
    email: Faker::Internet.email,
    password: 'password',
    name: Faker::Name.name,
    user_name: Faker::Internet.unique.username(specifier: 5..8), # ユニークなユーザー名を生成
    description: Faker::Lorem.sentence
  )
  users << user
end

# ポストの作成とコメントの作成
users.each do |user|
  5.times do
    post = Post.create!(
      user_id: user.id,
      body: Faker::Lorem.paragraph(sentence_count: 3), # ランダムな本文を生成
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude
    )

    5.times do
      Comment.create!(
        user_id: users.sample.id, # ランダムなユーザーからコメントを作成
        post_id: post.id,
        body: Faker::Lorem.sentence
      )
    end
  end
end
