json.extract! patient, :id, :first_name, :soccer_team_name, :created_at, :updated_at
json.url patient_url(patient, format: :json)
json.ssn patient.masked_ssn

