require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in user
  end

  describe 'GET #async' do
    context 'search' do
      it 'should render search.js.erb' do
        get :async, page: :search, id: user.id
        expect(response).to render_template :search
      end
    end

    context 'show' do
      it 'should render show.js.erb' do
        get :async, page: :show, id: user.id
        expect(response).to render_template :show
      end
    end

    context 'settings' do
      it 'should render settings.js.erb' do
        get :async, page: :settings, id: user.id
        expect(response).to render_template :settings
      end
    end
  end

  describe 'PUT #update' do
    context 'instruments' do
      it 'should add instruments to the list' do
        put :update, id: user, user: FactoryGirl.attributes_for(:user, instruments: "Saxophone Flute")
        user.reload
        expect(user.instruments).to eq(%w{Saxophone Flute})
      end
    end
  end
end
