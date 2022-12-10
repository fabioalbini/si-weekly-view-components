# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = 25.times.map do |i|
      new_product(id: i, name: "Product #{i}")
    end

    @query = params[:query]
    @products = @products.select { |p| p.name.include?(@query) } if @query.present?
  end

  def show
    @product = new_product(
      id: params[:id],
      name: "Product #{params[:id]}",
      description: "Description #{params[:id]}"
    )
  end

  private

  def new_product(id:, name:, description: '')
    status = id.to_i.even? ? 'active' : 'inactive'
    OpenStruct.new(id: id, name: name, description: description, status: status)
  end
end
