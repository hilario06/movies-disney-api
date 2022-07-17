require 'rails_helper'

RSpec.describe Api::V1::CharactersController, type: :controller do
  describe 'Restaurar un personaje' do
    let(:user) { create(:user) }
    let(:bearer) { create(:token, user: user) }
    let(:headers) { { Authorization: "Bearer #{bearer.token}" } }
    let(:character) { create(:character) }

    context 'Restaurar personaje satisfactoriamente' do
      before do
        character.destroy
        request.headers.merge! headers
        post(:restore, format: :json, params: { character_id: character.id })
      end
      context 'Respuesta con estatus ok' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
      context 'Estructura correcta del personaje' do
        subject { payload_test }
        it { is_expected.to include(:id, :name, :age, :weight, :story) }
      end
    end
    context 'Fallo restauracion del personaje' do
      before do
        character.destroy
        post(:restore, format: :json, params: { character_id: character.id })
      end
      context 'Respuesta con status unauthorized' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized) }
      end
    end
  end
end
