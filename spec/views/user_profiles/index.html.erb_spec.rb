require 'rails_helper'

RSpec.describe "user_profiles/index", type: :view do
  before(:each) do
    assign(:user_profiles, [
      UserProfile.create!(
        :fullname => "Fullname",
        :user => nil
      ),
      UserProfile.create!(
        :fullname => "Fullname",
        :user => nil
      )
    ])
  end

  it "renders a list of user_profiles" do
    render
    assert_select "tr>td", :text => "Fullname".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
