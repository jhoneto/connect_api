# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Channel, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:provider) }
    it { is_expected.to validate_presence_of(:channel_type) }
    it { is_expected.to validate_presence_of(:callback_url) }
    it { is_expected.to validate_presence_of(:callback_method) }
  end

  describe 'enums' do
    it do
      expect(described_class.providers).to eq('facebook' => 'facebook', 'gupshup' => 'gupshup')
    end

    it do
      expect(described_class.channel_types).to eq('whatsapp' => 'whatsapp')
    end
  end

  describe 'callbacks' do
    describe 'before_create' do
      let(:channel) { create(:channel) }

      it 'generates a uuid' do
        expect(channel.uuid).to be_present
      end
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:organization) }
  end
end
