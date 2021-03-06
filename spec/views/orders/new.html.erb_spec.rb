# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'orders/new', type: :view do
  before do
    assign(:order, Order.new(
                     customer: nil,
                     total_price: 1.5
                   ))
  end

  it 'renders new order form' do
    render

    assert_select 'form[action=?][method=?]', orders_path, 'post' do
      assert_select 'input[name=?]', 'order[customer_id]'

      assert_select 'input[name=?]', 'order[total_price]'
    end
  end
end
