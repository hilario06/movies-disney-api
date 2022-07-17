require 'rails_helper'

describe 'Rutas de los personajes' do
  it 'Ruta index de los personajes' do
    expect(get: '/api/v1/characters').to route_to(
      format: 'json',
      controller: 'api/v1/characters',
      action: 'index'
    )
  end
end
