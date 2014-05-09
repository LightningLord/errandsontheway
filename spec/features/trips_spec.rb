require 'spec_helper'

describe "Trips", :js => false do
  describe "root page" do
    it "renders the home page" do
      visit root_path
      expect(page).to have_content "Where are you going?"
    end
  end
end
