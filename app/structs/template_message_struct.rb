#frozen_string_literal: true

class TemplateMessageStruct < BaseStruct
  attribute :to, Types::String
  attribute :template_code, Types::String
  attribute :header_parameters, Types::Array
  attribute :body_parameters, Types::Array
end