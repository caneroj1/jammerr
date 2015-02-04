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

    it "instruments should initially be an empty array" do
      expect(user.instruments).to be_blank
    end

    it "can store instruments" do
      expect(FactoryGirl.create(:user_with_instruments).instruments).to eq(%w{Drums Guitar Bass})
    end

    it "address should initially be blank" do
      expect(user.address).to be_blank
    end

    it "city should initially be blank" do
      expect(user.city).to be_blank
    end

    it "state should initially be blank" do
      expect(user.state).to be_blank
    end

    it "has a first name" do
      expect(user.first_name).to_not be_blank
    end

    it "is invalid without a first name" do
      expect(FactoryGirl.build(:user, first_name: nil)).to_not be_valid
    end

    it "has a last name" do
      expect(user.first_name).to_not be_blank
    end

    it "is invalid without a last name" do
      expect(FactoryGirl.build(:user, last_name: nil)).to_not be_valid
    end

    context "with location" do
      let(:user) { FactoryGirl.create(:user_with_location) }

      it "has an address" do
        expect(user.address).to_not be_blank
      end

      it "has a state" do
        expect(user.state).to_not be_blank
      end

      it "has a city" do
        expect(user.city).to_not be_blank
      end

      it "neatly formats location" do
        expect(user.location).to eq("#{user.address}, #{user.city}, #{user.state}")
      end

      it "displays 'No address given' if state is missing" do
        expect(FactoryGirl.create(:user, state: "").location).to eq("No address given")
      end

      it "displays 'No address given' if city is missing" do
        expect(FactoryGirl.create(:user, city: "").location).to eq("No address given")
      end

      it "displays 'No address given' if address is missing" do
        expect(FactoryGirl.create(:user, address: "").location).to eq("No address given")
      end
    end
  end
end
