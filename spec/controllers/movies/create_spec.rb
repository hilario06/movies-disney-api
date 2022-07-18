require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :controller do
  describe 'Registro de Peliculas' do
    let(:user) { create(:user) }
    let(:bearer) { create(:token, user: user) }
    let(:headers) { { Authorization: "Bearer #{bearer.token}" } }
    let(:genre) { create(:genre) }
    let(:movie) {
      {
        title: Faker::Movie.title,
        creation_date: Faker::Date.between(from: '2000-01-01', to: '2021-12-31'),
        rating: rand(1..5),
        genre_id: genre.id
      }
    }
    context 'Registro de peliculas' do
      before do
        request.headers.merge! headers
        post(:create, format: :json, params: { movie: movie })
      end
      context 'Respuesta con status de created' do
        subject { response }
        it { is_expected.to have_http_status(:created) }
      end
      context 'Estructura correcta de la pelicula' do
        subject { payload_test }
        it { is_expected.to include(:id, :title, :creation_date, :rating, :genre_id, :created_at, :updated_at) }
      end
    end
    context 'Fallo registro de personaje' do
      before do
        movie[:title] = ''
        request.headers.merge! headers
        post(:create, format: :json, params: { movie: movie })
      end
      context 'Respuesta con status de bad request' do
        subject { response }
        it { is_expected.to have_http_status(:bad_request)}
      end
      context 'Estructura del lista de errores correcto' do
        subject { payload_test }
        it { is_expected.to include(:errors) }
      end
    end
    context 'Registro de personaje sin token' do
      before do
        post(:create, format: :json, params: { movie: :movie })
      end
      context 'Respuesta con status (unauthorized)' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized)}
      end
    end
  end
end
