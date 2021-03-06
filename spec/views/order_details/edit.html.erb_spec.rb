# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'order_details/edit', type: :view do
  before do
    @order_detail = assign(:order_detail, OrderDetail.create!(
                                            order: nil,
                                            menu: nil,
                                            quantity: 1
                                          ))
  end

  it 'renders the edit order_detail form' do
    render

    assert_select 'form[action=?][method=?]', order_detail_path(@order_detail), 'post' do
      assert_select 'input[name=?]', 'order_detail[order_id]'

      assert_select 'input[name=?]', 'order_detail[menu_id]'

      assert_select 'input[name=?]', 'order_detail[quantity]'
    end
  end
end
