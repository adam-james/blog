class Post
  include Mongoid::Document
  field :title, type: String
  field :body, type: String
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
end
