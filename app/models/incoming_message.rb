# frozen_string_literal: true

class IncomingMessage < ApplicationRecord
  belongs_to :organization

  enum provider: { facebook: 'facebook', gupshup: 'gupshup' }
  enum channel_type: { whatsapp: 'whatsapp' }

  validates :payload, presence: true
  # validates :channel_infos, presence: true
  validates :provider, presence: true, inclusion: { in: providers.keys }
  validates :channel_type, presence: true, inclusion: { in: channel_types.keys }

  before_create :generate_uuid
  after_create :process_message

  private

  def generate_uuid
    self.uuid = "in-#{SecureRandom.hex(10)}"
  end

  def process_message
    ProcessIncomingMessageJob.perform_later(id)
  end
end
