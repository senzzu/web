class Prescription < ApplicationRecord
    has_one :billing_history
    belongs_to :patient
end
