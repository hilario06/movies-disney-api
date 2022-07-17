require 'rails_helper'

RSpec.describe Api::V1::CharactersController, type: :controller do
  describe 'Listado de personajes' do
    let(:user) { create(:user) }
    let(:bearer) { create(:token, user: user) }
    let(:headers) { { Authorization: "Bearer #{bearer.token}" } }

    context 'se obtiene el listado de personajes correctamente' do
      before do
        request.headers.merge! headers
        get(:index, format: :json)
      end
      context 'Respuesta con estatus ok' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
      context 'Estructura del listado correcta' do
        subject { payload_test }
        it { is_expected.to include(:characters) }
      end
    end

    context 'Listado de personajes sin tokens' do
      before do
        get(:index, format: :json)
      end
      context 'Respuesta con status unauthorized' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized) }
      end
    end
  end
end
