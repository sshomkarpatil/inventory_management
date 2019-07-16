class Views::WarehousesProductDecorator < Views::BaseDecorator
  def item_count_css_class
    item_count < low_item_threshold ? 'danger' : ''
  end
end
