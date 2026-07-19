class Patient < ApplicationRecord
  audited except: [:ssn, :dob]
  encrypts :ssn, :dob

  def masked_ssn
    return if ssn.blank?

    "***-**-#{ssn.to_s.last(4)}"
  end

end
