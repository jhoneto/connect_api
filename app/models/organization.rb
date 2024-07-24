# frozen_string_literal: true

class Organization < ApplicationRecord
  validates :name, presence: true

  has_many :outgoing_messages, dependent: :destroy
  has_many :channels, dependent: :destroy

  before_create :generate_api_token

  private

  def generate_api_token
    self.api_token = SecureRandom.urlsafe_base64(32)
  end
end
