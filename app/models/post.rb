class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::History::Trackable

  field :title, type: String
  field :body, type: String
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true

  paginates_per 10

  # TODO remove comments
  track_history   :on => [:title, :body],       # track title and body fields only, default is :all
                  :modifier_field => :user, # adds "belongs_to :modifier" to track who made the change, default is :modifier, set to nil to not create modifier_field
                  :modifier_field_inverse_of => :nil, # adds an ":inverse_of" option to the "belongs_to :modifier" relation, default is not set
                  :modifier_field_optional => true, # marks the modifier relationship as optional (requires Mongoid 6 or higher)
                  :version_field => :version,   # adds "field :version, :type => Integer" to track current version, default is :version
                  :track_create  => true,       # track document creation, default is true
                  :track_update  => true,       # track document updates, default is true
                  :track_destroy => true        # track document destruction, default is true
end
