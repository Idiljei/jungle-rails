require 'rails_helper'


RSpec.describe User, type: :model do
  describe 'Validations' do

    it "validates :email, presence: true" do
      @user = User.new(name: 'Idil Jei', email: 'janedoe@gmail.com', password: '12345678', password_confirmation: '12345678')

      expect(@user).to be_valid
      expect @user.errors.full_messages
    end

    it "validates :name, presence: true" do
      @user = User.new(name: nil, email: 'janedoe@gmail.com', password: '12345678', password_confirmation: '12345678')

      expect(@user).to_not be_valid
      expect @user.errors.full_messages
    end

    it 'validates :password and :password_confirmation, should be the same' do
      @user = User.new(name: "Idil Jei", email: "janedoe@gmail.com", password: "24224", password_confirmation: "12345678")
      expect(@user).to_not be_valid
      
    end

     it 'validates email must be unique' do
      @user = User.create(name: "Idil Jei", email: "jdoe@gmail.com", password: "12345678", password_confirmation: "12345678")
      @user1 = User.create(name "Idil Jei",email: "jdoe@gmail.com", password: "12345678", password_confirmation: "12345678")
      expect(@user1).not_to be_valid
      end

    describe '.authenticate_with_credentials' do
      it "should successfully log in with valid credentials" do
        @user = User.create(name: 'Idil Jei', email: 'janedoe@gmail.com', password:'12345678', password_confirmation:'12345678')
        valid_user = User.authenticate_with_credentials('janedoe@gmail.com', '12345678')
        expect(valid_user).to eq(@user)
      end

      it "should not log in if credentials don't match" do
        @user = User.create(name: 'Idil Jei', email: 'janedoe@gmail.com', password:'12345678', password_confirmation:'12345678')
        loggingInUser = User.authenticate_with_credentials('janedoe@gmail.com', '12345678')
        expect(loggingInUser).to eq(nil)
      end

      it "should ignore whitespace" do
        @user = User.create(name: 'Idil Jei', email: 'janedoe@gmail.com', password:'12345678', password_confirmation:'12345678')
        loggingInUser = User.authenticate_with_credentials('janedoe@gmail.com', '12345678')
        expect(loggingInUser).to eq(@user)
      end

      it "should ignore capitals" do
        @user = User.create(name: 'Idil Jei', email: 'janedoe@gmail.com', password:'te12345678st', password_confirmation:'12345678')
        loggingInUser = User.authenticate_with_credentials('JANE@GMAIL', '12345678')
        expect(loggingInUser).to eq(@user)
      end
    
    end 
  end
  end
