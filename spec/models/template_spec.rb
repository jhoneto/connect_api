# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Template, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:organization) }
    it { is_expected.to belong_to(:channel) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:callback_method) }
    it { is_expected.to validate_presence_of(:callback_url) }
  end
end
