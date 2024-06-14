defmodule Estate.Dynam do
  import Number.Currency

  def calculate_cost(area, bedrooms, bathrooms, square_footage) do
    area * 100 + bedrooms * 5000 + bathrooms * 3000 + square_footage * 150
  end

  def calculate_cost(area, bathrooms) do
    area * 120 + bathrooms * 3500
  end

  def calculate_cost(square_footage) do
    square_footage * 150
  end

  def calculate_cost(rooms) do
    rooms * 2500
  end

  def format_price(price) do
    number_to_currency(price, separator: ".", delimiter: ",", precision: 2)
  end
end
