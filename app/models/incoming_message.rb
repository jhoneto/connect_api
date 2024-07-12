class IncomingMessage < ApplicationRecord
  belongs_to :organization

  enum provider: { facebook: 'facebook', gupshup: 'gupshup' }
  enum channel_type: { whatsapp: 'whatsapp' }

  validates :payload, presence: true
  validates :channel_infos, presence: true
  validates :provider, presence: true, inclusion: { in: providers.keys }
  validates :channel_type, presence: true, inclusion: { in: channel_types.keys }
end
