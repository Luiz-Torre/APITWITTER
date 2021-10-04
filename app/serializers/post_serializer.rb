class PostSerializer < ActiveModel::Serializer
  attributes :id, :text, :nickname

  def nickname
    self.object.user.nickname
  end


end
