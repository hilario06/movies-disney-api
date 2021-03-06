# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password # para el proceso automatico de encriptacion bcrypt

  has_many :tokens

  validates :email, :password_digest, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  after_create :send_welcome_email

  def send_welcome_email
    WelcomeMailer.welcome_email(self).deliver
  end
end
