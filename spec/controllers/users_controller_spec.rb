require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in user
  end
end
