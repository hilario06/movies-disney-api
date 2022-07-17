require 'rails_helper'

describe 'Rutas de los personajes' do
  it 'Ruta index de los personajes' do
    expect(get: '/api/v1/characters').to route_to(
      format: 'json',
      controller: 'api/v1/characters',
      action: 'index'
    )
  end

  it 'Ruta post de personajes' do
    expect(post: '/api/v1/characters').to route_to(
      format: 'json',
      controller: 'api/v1/characters',
      action: 'create'
    )
  end

  it 'Ruta PUT para actualizar personajes' do
    expect(put: '/api/v1/characters/1').to route_to(
      format: 'json',
      controller: 'api/v1/characters',
      action: 'update',
      id: '1'
    )
  end

  it 'Ruta delete personajes' do
    expect(delete: '/api/v1/characters/1').to route_to(
      format: 'json',
      controller: 'api/v1/characters',
      action: 'destroy',
      id: '1'
    )
  end

  it 'Ruta restaurar personaje' do
    expect(post: '/api/v1/characters/1/restore').to route_to(
      format: 'json',
      controller: 'api/v1/characters',
      action: 'restore',
      character_id: '1'
    )
  end
end
