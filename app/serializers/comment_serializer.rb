class CommentSerializer < ActiveModel::Serializer
  attributes :id, :creator_comment,:text, :post_origin



  def post_origin

    {
      creator_post: self.object.post.user.nickname,
      text_post_origin: self.object.post.text,
    }
  end

  def creator_comment
    self.object.user.nickname
  end

end
