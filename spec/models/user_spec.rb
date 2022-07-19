require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "should save if first_name, last_name, email, password, password_confirmation are all present" do
      user = User.new(first_name: "Keanu", last_name: "Reeves", email: "keanuizcool@icloud.me", password: "NEEEEOOOOO", password_confirmation: "NEEEEOOOOO")
      user.save

      expect(user.errors.full_messages).to be_empty
    end

    it "should error if password and password_confirmation don't match" do
      user = User.new(first_name: "Keanu", last_name: "Reeves", email: "keanuizcool@icloud.me", password: "NEEEEOOOOO", password_confirmation: "NEEEEOOOOOoo")
      user.save

      expect(user.errors.full_messages).not_to be_empty
    end


    it "should error if first_name is missing" do
      user = User.new(first_name: nil, last_name: "Reeves", email: "keanuizcool@icloud.me", password: "NEEEEOOOOO", password_confirmation: "NEEEEOOOOO")
      user.save

      expect(user.errors.full_messages).not_to be_empty
    end

    it "should error if last_name is missing" do
      user = User.new(first_name: "Keanu", last_name: nil, email: "keanuizcool@icloud.me", password: "NEEEEOOOOO", password_confirmation: "NEEEEOOOOO")
      user.save

      expect(user.errors.full_messages).not_to be_empty
    end

    it "should error if email is missing" do
      user = User.new(first_name: "Keanu", last_name: "Reeves", email: nil, password: "NEEEEOOOOO", password_confirmation: "NEEEEOOOOO")
      user.save

      expect(user.errors.full_messages).not_to be_empty
    end

    it "should error if password is missing" do
      user = User.new(first_name: "Keanu", last_name: "Reeves", email: "keanuizcool@icloud.me", password: nil, password_confirmation: "NEEEEOOOOO")
      user.save

      expect(user.errors.full_messages).not_to be_empty
    end

    it "should error if password_confirmation is missing" do
      user = User.new(first_name: "Keanu", last_name: "Reeves", email: "keanuizcool@icloud.me", password: "NEEEEOOOOO", password_confirmation: nil)
      user.save

      expect(user.errors.full_messages).not_to be_empty
    end

    it "should error if email is not unique" do
      first_user = User.new(first_name: "Keanu", last_name: "Reeves", email: "keanuizcool@icloud.me", password: "NEEEEOOOOO", password_confirmation: "NEEEEOOOOO")
      first_user.save

      second_user = User.new(first_name: "RealKeanu", last_name: "Reeves", email: "KEANUizCOOL@icloud.me", password: "NEEEEOOOOO", password_confirmation: "NEEEEOOOOO")
      second_user.save
      expect(second_user.errors.full_messages).not_to be_empty
    end

    it "should error if the password is less than 10 characters long" do
      user =  User.new(first_name: "Keanu", last_name: "Reeves", email: "keanuizcool@icloud.me", password: "kewlkewll", password_confirmation: "kewlkewll")
      user.save

      expect(user.errors.full_messages).not_to be_empty
    end

    it "should NOT error if the password is 10 or more characters long" do
      user =  User.new(first_name: "Keanu", last_name: "Reeves", email: "keanuizcool@icloud.me", password: "kewlkewlll", password_confirmation: "kewlkewlll")
      user.save

      expect(user.errors.full_messages).to be_empty
    end
  end
end
