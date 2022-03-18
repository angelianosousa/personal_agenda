require 'rails_helper'

RSpec.describe "steps/new", type: :view do
  before(:each) do
    assign(:step, Step.new(
      :name => "MyString"
    ))
  end

  it "renders new step form" do
    render

    assert_select "form[action=?][method=?]", steps_path, "post" do

      assert_select "input[name=?]", "step[name]"
    end
  end
end
