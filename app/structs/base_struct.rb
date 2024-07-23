# frozen_string_literal: true

module Types
  include Dry.Types()
end

class BaseStruct < Dry::Struct
  transform_keys(&:to_sym)
end
