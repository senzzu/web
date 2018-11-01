class Patient < ApplicationRecord
    
    has_many :prescriptions
    
    def full_name
        [first_name, last_name].join(' ')
    end
 
    def full_address
        [street_address, town, state, zipcode].join(', ')
    end
    
end
