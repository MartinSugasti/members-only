class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name, :username
  validates_length_of :name, minimum: 3, maximum: 50, allow_blank: false
  validates_length_of :username, minimum: 3, maximum: 50, allow_blank: false
end
