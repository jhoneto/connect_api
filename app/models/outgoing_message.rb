class OutgoingMessage < ApplicationRecord
  belongs_to :organization
  belongs_to :channel

  validates :payload, presence: true

  before_create :generate_uuid
  after_create :process_message

  private

  def generate_uuid
    self.uuid = "out-#{SecureRandom.hex(10)}"
  end

  def process_message
    ProcessOutgoingMessageJob.perform_later(self.id)
  end
end
