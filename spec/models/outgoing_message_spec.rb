# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OutgoingMessage, type: :model do
  include ActiveJob::TestHelper

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

    describe 'after_create' do
      after do
        clear_enqueued_jobs
        clear_performed_jobs
      end

      it 'processes the message' do
        expect { create(:outgoing_message) }.to have_enqueued_job(ProcessOutgoingMessageJob).with(kind_of(Integer))
      end
    end
  end
end
