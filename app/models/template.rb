# frozen_string_literal: true

class Template < ApplicationRecord
  belongs_to :organization
  belongs_to :channel

  validates :name, presence: true
  validates :content, presence: true
  validates :status, presence: true

  before_create :generate_uuid

  private

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end
end
