class User < ApplicationRecord
  after_initialize :set_default_role, if: :new_record?

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :username, uniqueness: true
  validates :roles, presence: true     

  has_many :posts
  has_many :comments       

  acts_as_voter


  
  def set_default_role
    self.add_role(:normal)
  end

         
end
