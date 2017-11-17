require 'rails_helper'

RSpec.describe ToysController, type: :controller do
  describe 'GET#new' do
    it 'responds successfully with an HTTP 200 status code'
    it 'renders the new template'
    it 'loads form for @toy'
  end
end
