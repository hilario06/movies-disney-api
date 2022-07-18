require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :controller do
  describe 'Eliminar un pelicula' do
    let(:user) { create(:user) }
    let(:bearer) { create(:token, user: user) }
    let(:headers) { { Authorization: "Bearer #{bearer.token}" } }
    let(:movie) { create(:movie) }

    context 'Eliminar pelicula satisfactoriamente' do
      before do
        request.headers.merge! headers
        delete(:destroy, format: :json, params: { id: movie.id })
      end
      context 'Respuesta con estatus ok' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
    end

    context 'Eliminar pelicula sin token' do
      before do
        delete(:destroy, format: :json, params: { id: movie.id } )
      end
      context 'Respuesta con status unauthorized' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized) }
      end
    end
  end
end
