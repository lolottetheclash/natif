require 'rails_helper'

RSpec.describe "variants/show", type: :view do
  before(:each) do
    @variant = assign(:variant, Variant.create!(
      :title => "Title",
      :item => nil,
      :price => 2,
      :stock => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
