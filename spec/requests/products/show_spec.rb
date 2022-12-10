
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products / Show Product', type: :request do
  context 'when displaying details for one product' do
    let(:product_component) { instance_double(ProductComponent) }

    before do
      allow(ProductComponent).to receive(:new).and_return(product_component)
      allow_any_instance_of(ActionView::Base).to receive(:render)
    end

    it 'renders view component' do
      get "/products/1"

      expect(ProductComponent).to have_received(:new).with(product: OpenStruct)
    end
  end
end
