require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :controller do
  describe 'Actualizar personajes' do
    let(:user) { create(:user) }
    let(:bearer) { create(:token, user: user) }
    let(:headers) { { Authorization: "Bearer #{bearer.token}"} }
    let(:movie) { create(:movie) }

    context 'pelicula actualizado correctamente' do
      before do
        request.headers.merge! headers
        put(:update, format: :json, params: { id: movie.id, movie: { title: Faker::Movie.title } })
      end
      context 'Respuesta con estatus ok' do
        subject{ response }
        it { is_expected.to have_http_status(:ok) }
      end
      context 'Estructura del pelicula correcto' do
        subject { payload_test }
        it { is_expected.to include(:id, :title, :creation_date, :rating, :genre_id) }
      end
    end

    context 'El pelicula no se puede actualizar' do
      before do
        request.headers.merge! headers
        put(:update, format: :json, params: { id: movie.id, movie: { title: ''} })
      end
      context 'Respuesta con status bad request' do
        subject { response }
        it { is_expected.to have_http_status(:bad_request) }
      end
      context 'Estructura de listado de errores correcta' do
        subject { payload_test }
        it { is_expected.to include(:errors)}
      end
    end

    context 'Actualizar pelicula sin token' do
      before do
        put(:update, format: :json, params: { id: movie.id, movie: { title: Faker::Movie.title }})
      end
      context 'Respuesta con status unauthorized' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized) }
      end
    end
  end
end
