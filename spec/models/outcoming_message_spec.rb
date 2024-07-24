require 'rails_helper'

RSpec.describe OutcomingMessage, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:organization) }
    it { is_expected.to belong_to(:channel) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:payload) }
  end
end
