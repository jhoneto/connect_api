# frozen_string_literal: true

class OutgoingMessage < ApplicationRecord
  belongs_to :organization
  belongs_to :channel
  belongs_to :template, optional: true

  validates :payload, presence: true

  before_create :generate_uuid
  after_create :process_message

  def method
    template.callback_method || channel.callback_method
  end

  def url
    template.callback_url || channel.callback_url
  end

  def headers
    template.callback_headers || channel.callback_headers
  end

  private

  def generate_uuid
    self.uuid = "out-#{SecureRandom.hex(10)}"
  end

  def process_message
    ProcessOutgoingMessageJob.perform_later(id)
  end
end
