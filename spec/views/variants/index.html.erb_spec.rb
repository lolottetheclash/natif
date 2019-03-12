require 'rails_helper'

RSpec.describe "variants/index", type: :view do
  before(:each) do
    assign(:variants, [
      Variant.create!(
        :title => "Title",
        :item => nil,
        :price => 2,
        :stock => 3
      ),
      Variant.create!(
        :title => "Title",
        :item => nil,
        :price => 2,
        :stock => 3
      )
    ])
  end

  it "renders a list of variants" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
