class OutgoingMessage < ApplicationRecord
  belongs_to :organization
  belongs_to :channel

  validates :payload, presence: true

  before_create :generate_uuid

  private

  def generate_uuid
    self.uuid = "out-#{SecureRandom.hex(10)}"
  end
end
