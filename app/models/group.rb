class Group < ActiveRecord::Base
  has_many :groups_users, dependent: :destroy
  has_many :users, through: :groups_users
  belongs_to :user
  validates :name, presence: true
end
