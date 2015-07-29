class User < ActiveRecord::Base
  has_many :achieveds
  has_many :achievements, through: :achieveds
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  # allow_nil is for testing purposes, has_secure_password will prevent a user from signing up with
  #   a blank password field
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def update_level
    new_level = 1
    points = sum_points

    if points >= 1200
      new_level = 7
    elsif points >= 900
      new_level = 6
    elsif points >= 650
      new_level = 5
    elsif points >= 400
      new_level = 4
    elsif points >= 200
      new_level = 3
    elsif points >= 100
      new_level = 2
    else
      new_level = 1
    end

    if self.level != new_level
      update_attribute(:level, new_level)
    end
  end

  def sum_points
    total_score = 0
    self.achievements.each do |achievement|
      total_score += achievement.value
    end

    return total_score
  end
end
