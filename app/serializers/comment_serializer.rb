class CommentSerializer < ActiveModel::Serializer
  attributes :id, :creator_comment, :text, :post_origin

  def creator_comment
    self.object.user.nickname
  end
  
  def post_origin
    {
      creator_post_origin: self.object.post.user.nickname,
      text_post_origin: self.object.post.text
    }
  end


end
