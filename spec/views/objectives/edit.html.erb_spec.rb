require 'rails_helper'

RSpec.describe "objectives/edit", type: :view do
  before(:each) do
    @objective = assign(:objective, Objective.create!(
      :user => nil,
      :name => "MyString"
    ))
  end

  it "renders the edit objective form" do
    render

    assert_select "form[action=?][method=?]", objective_path(@objective), "post" do

      assert_select "input[name=?]", "objective[user_id]"

      assert_select "input[name=?]", "objective[name]"
    end
  end
end
