# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TemplateMessageStruct do
  describe 'validations' do
    context 'when missing required attributes' do
      let(:params) do
        { template_code: 'confirmacao_consulta_completo', header_parameters: %w[1 2 3], body_parameters: %w[4 5 6] }
      end

      it 'is not valid' do
        expect { described_class.new(params) }.to raise_error(Dry::Struct::Error, /:to is missing/)
      end
    end
  end
end
