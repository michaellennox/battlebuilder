module Admin
  module Schemas
    class WarscrollParams
      include Hanami::Validations

      validations do
        required(:army_id).filled(:str?)
        required(:name).filled(:str?)
      end
    end
  end
end
