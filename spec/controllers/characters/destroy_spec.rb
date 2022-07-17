require 'rails_helper'

RSpec.describe Api::V1::CharactersController, type: :controller do
  describe 'Eliminar un personaje' do
    let(:user) { create(:user) }
    let(:bearer) { create(:token, user: user) }
    let(:headers) { { Authorization: "Bearer #{bearer.token}" } }
    let(:character) { create(:character) }

    context 'Eliminar personaje satisfactoriamente' do
      before do
        request.headers.merge! headers
        delete(:destroy, format: :json, params: { id: character.id })
      end
      context 'Respuesta con estatus ok' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
    end

    context 'Eliminar personaje sin token' do
      before do
        delete(:destroy, format: :json, params: { id: character.id } )
      end
      context 'Respuesta con status unauthorized' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized) }
      end
    end
  end
end
