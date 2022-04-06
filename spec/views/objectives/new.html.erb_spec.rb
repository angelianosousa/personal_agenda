require 'rails_helper'

RSpec.describe "objectives/new", type: :view do
  before(:each) do
    assign(:objective, Objective.new(
      :user => nil,
      :name => "MyString"
    ))
  end

  it "renders new objective form" do
    render

    assert_select "form[action=?][method=?]", objectives_path, "post" do

      assert_select "input[name=?]", "objective[user_id]"

      assert_select "input[name=?]", "objective[name]"
    end
  end
end
