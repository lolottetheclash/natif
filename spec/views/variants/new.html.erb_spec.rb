require 'rails_helper'

RSpec.describe "variants/new", type: :view do
  before(:each) do
    assign(:variant, Variant.new(
      :title => "MyString",
      :item => nil,
      :price => 1,
      :stock => 1
    ))
  end

  it "renders new variant form" do
    render

    assert_select "form[action=?][method=?]", variants_path, "post" do

      assert_select "input[name=?]", "variant[title]"

      assert_select "input[name=?]", "variant[item_id]"

      assert_select "input[name=?]", "variant[price]"

      assert_select "input[name=?]", "variant[stock]"
    end
  end
end
