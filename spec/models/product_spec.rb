require "rails_helper"

RSpec.describe Product, type: :model do

  describe 'Validations' do
    subject { create :product }

    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_presence_of(:sku) }
    it { is_expected.to validate_length_of(:sku).is_equal_to(8) }
    it { is_expected.to validate_uniqueness_of(:sku) }
    it { is_expected.to have_db_index(:sku) }

    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price) }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:warehouses_products).order(warehouse_id: :asc).dependent(:destroy).inverse_of(:product) }
    it { is_expected.to have_many(:warehouses).through(:warehouses_products).inverse_of(:products) }
    it { is_expected.to accept_nested_attributes_for(:warehouses_products) }
  end

  describe 'Callbacks' do
    subject { build :product }

    it 'triggers Product#create_warehouses_products after creating new product' do
      is_expected.to receive(:create_warehouses_products)
      subject.save
    end
  end

end