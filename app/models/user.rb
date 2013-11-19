class User < ActiveRecord::Base
  attr_accessible :session_token, :username, :password

  after_initialize :ensure_session_token

  validates :username, presence: true

  has_many :goals, class_name: "Goal", foreign_key: :user_id, primary_key: :id

  def self.find_by_credentials(username, password)
    user = self.find_by_username(username)

    user && user.is_password?(password) ? user : nil
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password).to_s
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.base64(16)
  end

end
