class OutcomingMessage < ApplicationRecord
  belongs_to :organization
  belongs_to :channel

  validates :payload, presence: true
end
