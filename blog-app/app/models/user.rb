# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  fullname        :string(255)
#  username        :string(255)
#  email           :string(255)
#  avatar          :string(255)
#  description     :string(255)
#  password_digest :string(255)
#  access_token    :string(255)
#  confirm_token   :string(255)
#  birthday        :date
#  access          :boolean          default("0")
#  blocked         :boolean          default("1")
#  email_confirmed :boolean          default("0")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base

  attr_accessor :token
  acts_as_paranoid column: :blocked, sentinel_value: false

  before_create :confirmation_token

  has_many :articles, dependent: :destroy
  has_many :attentions
  has_many :follow_user

  validates :username, presence: true
  validates :password, presence: true, length: { in: 6..15 }, on: :create
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i , message: "Email don't validated" }

  has_secure_password

  # enum email: [:unpublished, :published]

  # def self.published_in_the_past
  #   we expect this method to fail first
  #   where(nil)
  # end

  mount_uploader :avatar, AvatarUploader

  def email_activate
    email_confirmed = true
    confirm_token = nil
    save! validate: false
  end

  private
  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s if confirm_token.blank?
  end

end


