# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StandardizedMessageStruct do
  describe 'validations' do
    context 'when missing event attributes' do
      let(:params) do
        { from: {name: 'Hamilton', identifier: '123154'} }
      end

      it 'is not valid' do
        expect { described_class.new(params) }.to raise_error(Dry::Struct::Error, /:event is missing/)
      end
    end

    context 'when missing identifier attributes' do
      let(:params) do
        { event: 'status', from: {name: 'Hamilton'} }
      end

      it 'is not valid' do
        expect { described_class.new(params) }.to raise_error(Dry::Struct::Error, /:identifier is missing/)
      end
    end
  end
end
