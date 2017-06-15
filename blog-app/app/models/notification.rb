# == Schema Information
#
# Table name: notifications
#
#  id                    :integer          not null, primary key
#  notificationable_id   :integer
#  notificationable_type :string(255)
#  user_id               :integer
#  message               :string(255)
#  image                 :string(255)
#  count_notification    :integer
#  isChecked             :boolean          default("0")
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  fk_rails_b080fb4855  (user_id)
#

class Notification < ApplicationRecord
  belongs_to :notificationable, polymorphic: true, dependent: :destroy
  belongs_to :user
end
