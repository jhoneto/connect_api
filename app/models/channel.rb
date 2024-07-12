# frozen_string_literal: true

class Channel < ApplicationRecord
  belongs_to :organization
  enum provider: { facebook: 'facebook', gupshup: 'gupshup' }
  enum channel_type: { whatsapp: 'whatsapp' }

  validates :provider, presence: true, inclusion: { in: providers.keys }
  validates :channel_type, presence: true, inclusion: { in: channel_types.keys }

  validates :name, presence: true
  validates :provider, presence: true
  validates :channel_type, presence: true
  validates :callback_url, presence: true
  validates :callback_method, presence: true

  before_create :generate_uuid

  private

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end
end
