class Comment < ApplicationRecord
  belongs_to :article
  #has_many :childComments
  has_many :child_comments
end
