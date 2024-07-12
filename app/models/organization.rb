# frozen_string_literal: true

class Organization < ApplicationRecord
  validates :name, presence: true

  before_create :generate_api_token

  private

  def generate_api_token
    self.api_token = SecureRandom.urlsafe_base64(32)
  end
end
