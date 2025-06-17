class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :content,presence:true

  delegate :email,to: :user, prefix: true
end
