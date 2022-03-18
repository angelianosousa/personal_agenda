require 'rails_helper'

RSpec.describe "objectives/show", type: :view do
  before(:each) do
    @objective = assign(:objective, Objective.create!(
      :user => nil,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
  end
end
