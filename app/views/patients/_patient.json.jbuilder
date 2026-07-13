json.extract! patient, :id, :name, :dob, :created_at, :updated_at
json.url patient_url(patient, format: :json)
json.ssn_last_four patient.ssn.to_s.last(4) if patient.ssn.present?
