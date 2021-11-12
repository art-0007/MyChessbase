class User < ApplicationRecord
    attr_accessor :remember_token

    has_secure_password

    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
      
      

    has_many :puzzles, dependent: :destroy
    has_many :solutions, dependent: :destroy

    validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true
    
    def remember_me
        self.remember_token = SecureRandom.urlsafe_base64
        update_column :remember_token_digest, digest(remember_token)    
    end

    def forget_me
        update_column :remember_token_digest, nil
    end

    def remember_token_authenticated?(remember_token)
        return false unless remember_token_digest.present?
        BCrypt::Password.new(remember_token_digest).is_password?(remember_token)
    end

    private
    
    def digest(string)
        cost = ActiveModel::SecurePassword
            .min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

end
