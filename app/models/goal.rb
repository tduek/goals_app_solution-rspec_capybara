class Goal < ActiveRecord::Base
  attr_accessible :description, :is_private, :title, :user_id

  validates :title, :description, presence: true

  belongs_to :user, class_name: "User", foreign_key: :user_id, primary_key: :id
end
