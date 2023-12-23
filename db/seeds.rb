# ユーザーの作成
10.times do |i|
    User.create!(
      name:"user#{i + 1}",
      user_name: "user_name#{i + 1}",
      email: "user#{i + 1}@example.com",
      password: "password"
      profile_picture_path:File.open("./app/assets/images/smile.jpg")
      thumbnail_path:File.open("./app/assets/images/smile.jpg")
      description: "testtesttesttest"
      thumbnail_path: "I am user#{i + 1}"
    )
  end
  
  # 投稿の作成
  users = User.all
  users.each do |user|
    3.times do
      Post.create!(
        user: user,
        content: "This is a post by #{user.username}"
      )
    end
  end

  
  # コメントの作成
  posts = Post.all
  users.each do |user|
    posts.each do |post|
      Comment.create!(
        user: user,
        post: post,
        content: "Comment by #{user.username} on #{post.user.username}'s post."
      )
    end
  end
  
 
  