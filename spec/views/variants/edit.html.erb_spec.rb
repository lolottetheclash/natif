require 'rails_helper'

RSpec.describe "variants/edit", type: :view do
  before(:each) do
    @variant = assign(:variant, Variant.create!(
      :title => "MyString",
      :item => nil,
      :price => 1,
      :stock => 1
    ))
  end

  it "renders the edit variant form" do
    render

    assert_select "form[action=?][method=?]", variant_path(@variant), "post" do

      assert_select "input[name=?]", "variant[title]"

      assert_select "input[name=?]", "variant[item_id]"

      assert_select "input[name=?]", "variant[price]"

      assert_select "input[name=?]", "variant[stock]"
    end
  end
end
