require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :controller do
  let(:user) { create(:user) }
  let(:bearer) { create(:token, user: user) }
  let(:headers) { { Authorization: "Bearer #{bearer.token}" } }
  let(:movie) { create(:movie) }

  context 'Consultar pelicula por id' do
    before do
      request.headers.merge! headers # insertamos los headers
      get(:show, format: :json, params: { id: movie.id })
    end
    context 'Status 200' do
      subject { response }
      it { is_expected.to have_http_status(:ok) }
    end
    context 'Estructura correcta del pelicula' do
      subject { payload_test }
      it { is_expected.to include(:id, :title, :creation_date, :rating, :genre_id) }
    end
  end

  context 'Consultar pelicula sin token' do
    before do
      get(:show, format: :json, params: { id: movie.id })
    end
    context 'Status de response no autorizado' do
      subject { response }
      it { is_expected.to have_http_status(:unauthorized) }
    end
  end
end
