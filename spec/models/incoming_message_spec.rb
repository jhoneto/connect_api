require 'rails_helper'

RSpec.describe IncomingMessage, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:payload) }
    it { is_expected.to validate_presence_of(:channel_infos) }
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
end
