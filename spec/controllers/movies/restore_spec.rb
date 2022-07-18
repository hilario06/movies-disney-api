require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :controller do
  describe 'Restaurar un pelicula' do
    let(:user) { create(:user) }
    let(:bearer) { create(:token, user: user) }
    let(:headers) { { Authorization: "Bearer #{bearer.token}" } }
    let(:movie) { create(:movie) }

    context 'Restaurar pelicula satisfactoriamente' do
      before do
        movie.destroy
        request.headers.merge! headers
        post(:restore, format: :json, params: { movie_id: movie.id })
      end
      context 'Respuesta con estatus ok' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
      context 'Estructura correcta de la pelicula' do
        subject { payload_test }
        it { is_expected.to include(:id, :title, :creation_date, :rating, :genre_id) }
      end
    end
    context 'Fallo restauracion de la pelicula' do
      before do
        movie.destroy
        post(:restore, format: :json, params: { movie_id: movie.id })
      end
      context 'Respuesta con status unauthorized' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized) }
      end
    end
  end
end
