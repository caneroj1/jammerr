describe User do
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  context "attributes" do
    let(:user) { FactoryGirl.create(:user) }

    it "has an email" do
      expect(user.email).to_not be_blank
    end

    it "is invalid without an email" do
      expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
    end

    it "has a password" do
      expect(user.password).to_not be_blank
    end

    it "is invalid without a password" do
      expect(FactoryGirl.build(:user, password: nil)).to_not be_valid
    end

    it "has a list of instruments" do
      expect(user.instruments.class).to eq(Array)
    end

    it "should initially be an empty array" do
      expect(user.instruments).to be_blank
    end

    it "can store instruments" do
      expect(FactoryGirl.create(:user_with_instruments).instruments).to eq(%w{Drums Guitar Bass})
    end
  end
end
