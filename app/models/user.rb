# frozen_string_literal: true

class User < ApplicationRecord
  enum role: { basic: 0, moderator: 1, admin: 2 }, _suffix: :role

  attr_accessor :remember_token

  has_secure_password

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' },
                             default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: %r{\Aimage/.*\z}

  has_many :puzzles, dependent: :destroy
  has_many :solutions, dependent: :destroy
  has_many :articles, dependent: :destroy

  scope :user_with_most_puzzles, -> { joins(:puzzles).group(:user_id).order('COUNT(puzzles.id) desc').limit(1)}
  
  validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true

  def remember_me
    self.remember_token = SecureRandom.urlsafe_base64
    update_column :remember_token_digest, digest(remember_token)
  end

  def forget_me
    update_column :remember_token_digest, nil
  end

  def remember_token_authenticated?(remember_token)
    return false if remember_token_digest.blank?

    BCrypt::Password.new(remember_token_digest).is_password?(remember_token)
  end

  def author?(obj)
    #binding.pry
    obj.user == self
  end

  def guest?
    false
  end

  private

  def digest(string)
    cost = if ActiveModel::SecurePassword
              .min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end
end
