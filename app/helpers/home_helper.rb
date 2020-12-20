module HomeHelper
  def truncate_post_body(post)
    post.body.truncate(400)
  end
end
