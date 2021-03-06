# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Menu, type: :model do
  it 'is valid with a name and a price' do
    menu = described_class.new(
      name: 'Makanan',
      price: 15_000
    )

    expect(menu).to be_valid
  end

  it 'is invalid without a name or and a price' do
    menu = described_class.new(
      name: nil,
      price: 15_000
    )

    menu.valid?
    expect(menu.errors[:name]).to include("can't be blank")

    menu2 = described_class.new(
      name: 'Makanan',
      price: nil
    )

    menu2.valid?
    expect(menu2.errors[:price]).to include("can't be blank")
  end

  it 'is invalid with a duplicate name' do
    described_class.create(
      name: 'Makanan',
      price: 15_000
    )

    menu2 = described_class.new(
      name: 'Makanan',
      price: 11_000
    )

    menu2.valid?
    expect(menu2.errors[:name]).to include('has already been taken')
  end

  it 'is invalid with a description longer than 150 character' do
    chars = 'ABCDEFGHIJ'
    x = 15
    desc = ''
    while x >= 1
      desc += chars
      x -= 1
    end

    menu = described_class.new(
      name: 'Makanan',
      price: 15_000,
      description: desc
    )
    expect(menu).to be_valid
    menu.description += 'A'.to_s
    expect(menu).not_to be_valid
  end

  it 'is invalid with price lower than than 0.01' do
    menu = described_class.new(
      name: 'Makanan',
      price: 0.001
    )

    menu.valid?

    expect(menu.errors[:price]).to include('must be greater than or equal to 0.01')
  end
end
