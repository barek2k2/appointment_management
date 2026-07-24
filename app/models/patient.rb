class Patient < ApplicationRecord
  belongs_to :user
  encrypts :ssn

  def masked_ssn
    return if ssn.blank?

    "***-**-#{ssn.to_s.last(4)}"
  end

end
