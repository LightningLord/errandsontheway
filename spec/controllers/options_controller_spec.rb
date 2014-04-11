require 'spec_helper'

describe OptionsController do
  context '#index' do
    it 'assigns a search term based on params' do
      get :index, :search => "Tacos"
      expect(assigns(:search_term)).to eq('Tacos')
    end
  end
end
