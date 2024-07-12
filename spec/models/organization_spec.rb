# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'callbacks' do
    describe 'before_create' do
      it 'generates an api token' do
        organization = described_class.create(name: 'Test Organization')
        expect(organization.api_token).to be_present
      end
    end
  end
end
