class PatientsController < ApplicationController
  def external_data
    patient = Patient.find(params[:id])

    response = HTTParty.get(
      "http://jsonplaceholder.typicode.com/posts/#{patient.id}",
      headers: {
        'Authorization' => 'Bearer token'
      }
    )

    if response.success?
      render json: {
        patient: {
          id: patient.id,
          first_name: patient.first_name,
          last_name: patient.last_name
        },
        external_data: response.parsed_response
      }
    else
      render json: {
        error: 'Failed to retrieve external data'
      }, status: :bad_gateway
    end
  end
end
