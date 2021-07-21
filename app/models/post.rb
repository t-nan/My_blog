class Post < ApplicationRecord

  validates :author,presence: true
  validates :body,presence: true  
   
  has_many :comments

  acts_as_votable

end
