class Patient < ApplicationRecord
  audited
  encrypts :ssn
end
