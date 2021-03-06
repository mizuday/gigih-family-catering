# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'orders/edit', type: :view do
  before do
    @order = assign(:order, Order.create!(
                              customer: nil,
                              total_price: 1.5
                            ))
  end

  it 'renders the edit order form' do
    render

    assert_select 'form[action=?][method=?]', order_path(@order), 'post' do
      assert_select 'input[name=?]', 'order[customer_id]'

      assert_select 'input[name=?]', 'order[total_price]'
    end
  end
end
