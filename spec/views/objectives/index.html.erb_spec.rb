require 'rails_helper'

RSpec.describe "objectives/index", type: :view do
  before(:each) do
    assign(:objectives, [
      Objective.create!(
        :user => nil,
        :name => "Name"
      ),
      Objective.create!(
        :user => nil,
        :name => "Name"
      )
    ])
  end

  it "renders a list of objectives" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
