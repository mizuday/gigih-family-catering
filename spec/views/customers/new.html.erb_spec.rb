# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'customers/new', type: :view do
  before do
    assign(:customer, Customer.new(
                        name: 'MyString',
                        email: 'MyString',
                        address: 'MyText'
                      ))
  end

  it 'renders new customer form' do
    render

    assert_select 'form[action=?][method=?]', customers_path, 'post' do
      assert_select 'input[name=?]', 'customer[name]'

      assert_select 'input[name=?]', 'customer[email]'

      assert_select 'textarea[name=?]', 'customer[address]'
    end
  end
end
