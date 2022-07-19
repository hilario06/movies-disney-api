require 'rails_helper'

RSpec.describe Api::V1::CharactersController, type: :controller do
  describe 'Registro de personajes' do
    let(:user) { create(:user) }
    let(:bearer) { create(:token, user: user) }
    let(:headers) { { Authorization: "Bearer #{bearer.token}" } }
    let(:character) {
      {
        name: Faker::Name.name,
        age: rand(18..65),
        weight: rand(35.0..100).round(2),
        story: Faker::Lorem.sentence(word_count: 15, supplemental: true)
      }
    }
    context 'Registro de personaje' do
      before do
        request.headers.merge! headers
        post(:create, format: :json, params: { character: character })
      end
      context 'Respuesta con status de created' do
        subject { response }
        it { is_expected.to have_http_status(:created) }
      end
      context 'Estructura correcta del icono geografico' do
        subject { payload_test }
        it { is_expected.to include(:id, :name, :age, :weight, :story) }
      end
    end
    context 'Fallo registro de personaje' do
      before do
        character[:name] = ''
        request.headers.merge! headers
        post(:create, format: :json, params: { character: character })
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
        post(:create, format: :json, params: { character: :character })
      end
      context 'Respuesta con status (unauthorized)' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized)}
      end
    end
  end
end
