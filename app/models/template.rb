class Template < ApplicationRecord
  belongs_to :organization
  belongs_to :channel

  validates :name, presence: true
  validates :content, presence: true
  validates :status, presence: true
  validates :callback_method, presence: true
  validates :callback_url, presence: true
end
