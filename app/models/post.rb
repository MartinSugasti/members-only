class Post < ApplicationRecord
  validates_presence_of :body
  validates_length_of :body, minimum: 1, maximum: 300, allow_blank: false

  belongs_to :user
end
