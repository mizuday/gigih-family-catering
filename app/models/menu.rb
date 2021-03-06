# frozen_string_literal: true

class Menu < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
  validates :description, length: { maximum: 150 }
  has_many :menu_categories, dependent: :destroy
  has_many :categories, through: :menu_categories
end
