class User < ApplicationRecord
    has_secure_password

    has_many :pazzles
    has_many :user_solutions

    validates :email, presence: true, uniqueness: true

end
