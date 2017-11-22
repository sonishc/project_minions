require 'rails_helper'

RSpec.describe Admin::DashboardController, type: :controller do
  describe 'GET #index' do
    it 'returns a 302 custom status code' do
      get :index
      expect(response).to have_http_status(302)
    end
  end
end
