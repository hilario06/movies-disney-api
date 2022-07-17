require 'rails_helper'

describe 'Rutas de los peliculas' do
  it 'Ruta index de las peliculas' do
    expect(get: '/api/v1/movies').to route_to(
      format: 'json',
      controller: 'api/v1/movies',
      action: 'index'
    )
  end
end
