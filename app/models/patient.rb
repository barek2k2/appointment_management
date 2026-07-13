class Patient < ApplicationRecord
  audited except: %i[ssn dob]
  encrypts :ssn

  def masked_ssn
    return if ssn.blank?

    "***-**-#{ssn.to_s.last(4)}"
  end

end
