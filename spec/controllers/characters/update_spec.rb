require 'rails_helper'

RSpec.describe Api::V1::CharactersController, type: :controller do
  describe 'Actualizar personajes' do
    let(:user) { create(:user) }
    let(:bearer) { create(:token, user: user) }
    let(:headers) { { Authorization: "Bearer #{bearer.token}"} }
    let(:character) { create(:character) }

    context 'personaje actualizado correctamente' do
      before do
        request.headers.merge! headers
        put(:update, format: :json, params: { id: character.id, character: { name: Faker::Name.name } })
      end
      context 'Respuesta con estatus ok' do
        subject{ response }
        it { is_expected.to have_http_status(:ok) }
      end
      context 'Estructura del personaje correcto' do
        subject { payload_test }
        it { is_expected.to include(:id, :name, :age, :weight, :story) }
      end
    end

    context 'El personaje no se puede actualizar' do
      before do
        request.headers.merge! headers
        put(:update, format: :json, params: { id: character.id, character: { name: ''} })
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

    context 'Actualizar personaje sin token' do
      before do
        put(:update, format: :json, params: { id: character.id, character: { name: Faker::Name.name }})
      end
      context 'Respuesta con status unauthorized' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized) }
      end
    end
  end
end
