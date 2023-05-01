require 'rails_helper'

RSpec.describe User, type: :model do
 
  describe 'Validations' do
    before do
      @user = User.new(
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password',
        first_name: 'John',
        last_name: 'Doe'
      )
    end

    it 'user should be created with password and password_confirmation fields' do
      expect(@user).to be_valid
    end

    it 'should not be created if password and password_confirmation do not match' do
      @user.password_confirmation = 'notpassword'
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should not be created without email' do
      @user.email = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should not be created without first name' do
      @user.first_name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'should not be created without last name' do
      @user.last_name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'should not allow duplicate emails' do
      @user.save
      user2 = User.new(
        email: 'test@test.com',
        password: 'password2',
        password_confirmation: 'password2',
        first_name: 'John2',
        last_name: 'Doe2'
      )
      user2.save
      expect(user2).to_not be_valid
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should not allow case sensitivity to matter with email' do
      @user.save
      user2 = User.new(
        email: 'TEST@test.com',
        password: 'password2',
        password_confirmation: 'password2',
        first_name: 'John2',
        last_name: 'Doe2'
      )
      user2.save
      expect(user2).to_not be_valid
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should require at least 6 characters for password length' do
      @user.password = 'pw'
      @user.password_confirmation = 'pw'

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

  end

  






end
