require 'rails_helper'

describe 'Routes Spec', type: :routing do
  describe 'Invenmtory Management Routes' do
    describe 'Products Controller' do

      it 'routes GET / to ProductsController#index' do
        expect(get: '/').to route_to(controller: 'products', action: 'index')
      end

      it 'routes GET /products to ProductsController#index' do
        expect(get: '/').to route_to(controller: 'products', action: 'index')
      end

      it 'routes GET /products/:id/edit to ProductsController#edit' do
        expect(get: '/products/123/edit').to route_to(controller: 'products', action: 'edit', id: '123')
      end

      it 'routes PATCH /products/:id/edit to ProductsController#update' do
        expect(patch: '/products/123').to route_to(controller: 'products', action: 'update', id: '123')
      end

    end

    describe 'Warehouses Controller' do
      it 'routes GET /warehouses/new to WarehousesController#index' do
        expect(get: '/warehouses/new').to route_to(controller: 'warehouses', action: 'new')
      end

      it 'routes POST /warehouses to ProductsController#index' do
        expect(post: '/warehouses').to route_to(controller: 'warehouses', action: 'create')
      end
    end
  end
end
