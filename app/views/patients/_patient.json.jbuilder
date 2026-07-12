json.extract! patient, :id, :name, :ssn, :dob, :created_at, :updated_at
json.url patient_url(patient, format: :json)
