require 'rails_helper'

describe 'Rutas de los peliculas' do
  it 'Ruta index de las peliculas' do
    expect(get: '/api/v1/movies').to route_to(
      format: 'json',
      controller: 'api/v1/movies',
      action: 'index'
    )
  end

  it 'Ruta (post) creacion de peliculas' do
    expect(post: '/api/v1/movies').to route_to(
      format: 'json',
      controller: 'api/v1/movies',
      action: 'create'
    )
  end

  it 'Ruta PUT para actualizar peliculas' do
    expect(put: '/api/v1/movies/1').to route_to(
      format: 'json',
      controller: 'api/v1/movies',
      action: 'update',
      id: '1'
    )
  end

  it 'Ruta delete peliculas' do
    expect(delete: '/api/v1/movies/1').to route_to(
      format: 'json',
      controller: 'api/v1/movies',
      action: 'destroy',
      id: '1'
    )
  end

  it 'Ruta restaurar pelicula' do
    expect(post: '/api/v1/movies/1/restore').to route_to(
      format: 'json',
      controller: 'api/v1/movies',
      action: 'restore',
      movie_id: '1'
    )
  end
end
