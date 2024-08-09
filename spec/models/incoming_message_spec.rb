# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IncomingMessage, type: :model do
  include ActiveJob::TestHelper

  describe 'validations' do
    it { is_expected.to validate_presence_of(:payload) }
    it { is_expected.to validate_presence_of(:provider) }
    it { is_expected.to validate_presence_of(:channel_type) }
  end

  describe 'enums' do
    it do
      expect(described_class.providers).to eq('facebook' => 'facebook', 'gupshup' => 'gupshup')
    end

    it do
      expect(described_class.channel_types).to eq('whatsapp' => 'whatsapp')
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:organization) }
  end

  describe 'after_create' do
    after do
      clear_enqueued_jobs
      clear_performed_jobs
    end

    it 'processes the message' do
      expect { create(:incoming_message) }.to have_enqueued_job(ProcessIncomingMessageJob).with(kind_of(Integer))
    end
  end
end
