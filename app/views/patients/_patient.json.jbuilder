json.extract! patient, :id, :name, :country, :football_team, :ssn, :created_at, :updated_at
json.url patient_url(patient, format: :json)
