require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.create!(
      name:     'Bloccit User',
      email:    'user@bloccit.com',
      password: 'password'
    )
  end

  # Shoulda tests for name
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(1) }

  # Shoulda tests for email
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_least(3) }
  it { is_expected.to allow_value('user@bloccit.com').for(:email) }

  # Shoulda tests for password
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to have_secure_password }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }

  describe 'attributes' do
    it 'should have name and email attributes' do
      expect(user).to have_attributes(
        name: 'Bloccit User',
        email: 'user@bloccit.com'
      )
    end

    it 'should capitalize names' do
      user.name = 'bloccit user'
      user.save
      expect(user.name).to eq 'Bloccit User'
    end

  end

  describe "invalid user" do
    let(:user_with_invalid_name) do
      User.new(
        name: "",
        email: "user@bloccit.com"
      )
    end
    let(:user_with_invalid_email) do
      User.new(
        name: "Bloccit User",
        email: ""
      )
    end

    it "should be an invalid user due to blank name" do
      expect(user_with_invalid_name).to_not be_valid
    end

    it "should be an invalid user due to blank email" do
      expect(user_with_invalid_email).to_not be_valid
    end
  end
end
