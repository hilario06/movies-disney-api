require 'rails_helper'

RSpec.describe Api::V1::CharactersController, type: :controller do
  let(:user) { create(:user) }
  let(:bearer) { create(:token, user: user) }
  let(:headers) { { Authorization: "Bearer #{bearer.token}" } }
  let(:character) { create(:character) }

  context 'Consultar personaje por id' do
    before do
      request.headers.merge! headers # insertamos los headers
      get(:show, format: :json, params: { id: character.id })
    end
    context 'Status 200' do
      subject { response }
      it { is_expected.to have_http_status(:ok) }
    end
    context 'Estructura correcta del personaje' do
      subject { payload_test }
      it { is_expected.to include(:id, :name, :age, :weight, :story) }
    end
  end

  context 'Consultar personaje sin token' do
    before do
      get(:show, format: :json, params: { id: character.id })
    end
    context 'Status de response no autorizado' do
      subject { response }
      it { is_expected.to have_http_status(:unauthorized) }
    end
  end
end
