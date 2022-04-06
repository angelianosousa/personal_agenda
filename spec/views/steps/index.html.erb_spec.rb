require 'rails_helper'

RSpec.describe "steps/index", type: :view do
  before(:each) do
    assign(:steps, [
      Step.create!(
        :name => "Name"
      ),
      Step.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of steps" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
