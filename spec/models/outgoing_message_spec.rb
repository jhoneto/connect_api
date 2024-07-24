require 'rails_helper'

RSpec.describe OutgoingMessage, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:organization) }
    it { is_expected.to belong_to(:channel) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:payload) }
  end

  describe 'callbacks' do
    describe 'before_create' do
      let(:outgoing_message) { create(:outgoing_message) }

      it 'generates a uuid' do
        expect(outgoing_message.uuid).to be_present
      end
    end
  end
end
