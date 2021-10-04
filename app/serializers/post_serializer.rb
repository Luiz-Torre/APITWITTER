class PostSerializer < ActiveModel::Serializer
  attributes :id, :text, :nickname
  has_many :comment

  def nickname
    self.object.user.nickname
  end


end
