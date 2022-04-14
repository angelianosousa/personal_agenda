require 'rails_helper'

RSpec.describe "user_profiles/show", type: :view do
  before(:each) do
    @user_profile = assign(:user_profile, UserProfile.create!(
      :fullname => "Fullname",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Fullname/)
    expect(rendered).to match(//)
  end
end
