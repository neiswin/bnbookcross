class User < ApplicationRecord
  enum role: { basic: 0, moderator: 1, admin: 2 }, _suffix: :role

  has_many :books, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :nickname, presence: true, length: { minimum: 2 }, uniqueness: true
  
end
