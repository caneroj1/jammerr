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
      context 'with no instruments' do
        it 'should add instruments to the list' do
          put :update, id: user, user: FactoryGirl.attributes_for(:user, instruments: "Saxophone Flute")
          user.reload
          expect(user.instruments).to eq(%w{Saxophone Flute})
        end
      end

      context 'with existing instruments' do
        let(:user) { FactoryGirl.create(:user_with_instruments) }

        it 'should change the instruments list' do
          prev_instruments = user.instruments
          put :update, id: user, user: FactoryGirl.attributes_for(:user, instruments: "#{prev_instruments.join(' ')} Saxophone")
          user.reload
          expect(user.instruments).to eq(prev_instruments + %w{Saxophone})
        end

        it 'should remove instruments' do
          put :update, id: user, user: FactoryGirl.attributes_for(:user, instruments: "Drums")
          user.reload
          expect(user.instruments).to eq(%w{Drums})
        end
      end
    end

    context 'first name' do
      it 'should be able to change first name' do
        put :update, id: user.id, user: FactoryGirl.attributes_for(:user, first_name: "Jameson")
        user.reload
        expect(user.first_name).to eq("Jameson")
      end

      it 'should not be able to make first name blank' do
        put :update, id: user.id, user: FactoryGirl.attributes_for(:user, first_name: "")
        user.reload
        expect(user.first_name).to_not be_blank
      end
    end

    context 'last name' do
      it 'should be able to change last name' do
        put :update, id: user.id, user: FactoryGirl.attributes_for(:user, last_name: "Smithson")
        user.reload
        expect(user.last_name).to eq("Smithson")
      end

      it 'should not be able make last name blank' do
        put :update, id: user.id, user: FactoryGirl.attributes_for(:user, last_name: "")
        user.reload
        expect(user.last_name).to_not be_blank
      end
    end

    context 'location' do
      it 'can update address' do
        put :update, id: user, user: FactoryGirl.attributes_for(:user, address: "20 Nighthawk Road")
        user.reload
        expect(user.address).to eq("20 Nighthawk Road")
      end

      it 'can update city' do
        put :update, id: user, user: FactoryGirl.attributes_for(:user, city: "Smithville")
        user.reload
        expect(user.city).to eq("Smithville")
      end

      it 'can update state' do
        put :update, id: user, user: FactoryGirl.attributes_for(:user, state: "California")
        user.reload
        expect(user.state).to eq("California")
      end
    end
  end
end
