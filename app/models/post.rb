class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :body, type: String
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true

  paginates_per 10
end
