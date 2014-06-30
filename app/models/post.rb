class Post < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 5} 
  validates :data, presence: true
  belongs_to :user
end
