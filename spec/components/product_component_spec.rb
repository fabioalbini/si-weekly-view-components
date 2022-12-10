require 'rails_helper'

RSpec.describe ProductComponent, type: :component do
  let(:product) { OpenStruct.new(id: 1, name: name, description: description, status: status) }
  let(:name) { 'Test' }
  let(:status) { 'status' }
  let(:description) { 'this is a test' }

  before do
    render_inline(described_class.new(product: product))
  end

  it 'displays information about product' do
    expect(page).to have_content(name)
    expect(page).to have_content(description)
    expect(page).to have_content(status)
  end

  context 'when product does not contain name' do
    let(:name) { '' }

    it 'display N/A instead' do
      expect(page).to have_content('Name: N/A')
    end
  end

  context 'when product does not contain description' do
    let(:description) { '' }

    it 'display N/A instead' do
      expect(page).to have_content('Description: N/A')
    end
  end

  context 'when product is active' do
    let(:status) { 'active' }

    it 'displays status in green' do
      span = page.find('.product_status')
      expect(span).to have_css('[style="color: green;"]')
    end
  end

  context 'when product is inactive' do
    let(:status) { 'inactive' }

    it 'displays status in green' do
      span = page.find('.product_status')
      expect(span).to have_css('[style="color: red;"]')
    end
  end
end
