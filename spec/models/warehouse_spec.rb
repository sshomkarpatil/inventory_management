require "rails_helper"

RSpec.describe Warehouse, type: :model do

  describe 'Validations' do
    subject { create :warehouse }

    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_presence_of(:pincode) }
    it { is_expected.to validate_length_of(:pincode).is_equal_to(6) }

    it { is_expected.to validate_presence_of(:wh_code) }
    it { is_expected.to validate_uniqueness_of(:wh_code) }
    it { is_expected.to have_db_index(:wh_code) }
    it { is_expected.to validate_length_of(:wh_code).is_at_least(4).is_at_most(16) }

    it { is_expected.to validate_presence_of(:max_capacity) }
    it { is_expected.to validate_numericality_of(:max_capacity).only_integer }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:warehouses_products).dependent(:destroy).inverse_of(:warehouse) }
    it { is_expected.to have_many(:products).through(:warehouses_products).inverse_of(:warehouses) }
  end

  describe 'Callbacks' do
    subject { build :warehouse }

    it 'triggers Product#create_warehouses_products after creating new warehouse' do
      is_expected.to receive(:create_warehouses_products)
      subject.save
    end
  end

end
