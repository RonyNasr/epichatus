require 'spec_helper'

describe('signing up a new user', {:type => :feature}) do
  it "allows user to create a new account" do
    visit('/')
    click_link('SIGN UP')
    fill_in('signup_username', :with => 'Bobby')
    fill_in('signup_email', :with => 'bob@bob.com')
    fill_in('signup_password', :with => '1234')
    click_button('signup_button')
    expect(page).to have_content('SIGN OUT')
  end
  it "does not allow user to create a new account if username is already taken" do
    user = User.create({:username => 'Bob', :email=> 'bob@bob.com', :password => '1234'})
    visit('/')
    click_link('SIGN UP')
    fill_in('signup_username', :with => 'Bob')
    fill_in('signup_email', :with => 'bob@test.com')
    fill_in('signup_password', :with => '1234')
    click_button('signup_button')
    expect(page).to have_content('That username is taken')
  end
  it "does not allow user to create a new account if email is already taken" do
    user = User.create({:username => 'Bob', :email=> 'bob@bob.com', :password => '1234'})
    visit('/')
    click_link('SIGN UP')
    fill_in('signup_username', :with => 'Emily')
    fill_in('signup_email', :with => 'bob@bob.com')
    fill_in('signup_password', :with => '1234')
    click_button('signup_button')
    expect(page).to have_content('That email is already registered to an account')
  end
end

describe('logging into your account', {:type=> :feature}) do
  it "allows user to sign in" do
    visit('/')
    click_link('SIGN UP')
    fill_in('signup_username', :with => 'Bobby')
    fill_in('signup_email', :with => 'bob@bob.com')
    fill_in('signup_password', :with => '1234')
    click_button('signup_button')
    visit('/')
    click_link('LOGIN')
    fill_in('email', :with => 'bob@bob.com')
    fill_in('password', :with => '1234')
    click_button('login_button')
    expect(page).to have_content('SIGN OUT')
  end
  it "does not allow a non-existant user to sign in" do
    visit('/')
    click_link('LOGIN')
    fill_in('email', :with => 'bob@bob.com')
    fill_in('password', :with => '1234')
    click_button('login_button')
    expect(page).to have_content('Invalid username or password')
  end
end

describe('interacting with user list', {:type=> :feature}) do
  it "allows user to sign in and view all saved users" do
    user = User.create({:username => 'Katka', :email=> 'katka@katka.com', :password => '1234'})
    visit('/')
    click_link('SIGN UP')
    fill_in('signup_username', :with => 'Bobby')
    fill_in('signup_email', :with => 'bob@bob.com')
    fill_in('signup_password', :with => '1234')
    click_button('signup_button')
    visit('/')
    click_link('LOGIN')
    fill_in('email', :with => 'bob@bob.com')
    fill_in('password', :with => '1234')
    click_button('login_button')
    expect(page).to have_content('Katka')
  end
  it "allows user to open chatbox" do
    user = User.create({:username => 'Katka', :email=> 'katka@katka.com', :password => '1234'})
    visit('/')
    click_link('SIGN UP')
    fill_in('signup_username', :with => 'Bobby')
    fill_in('signup_email', :with => 'bob@bob.com')
    fill_in('signup_password', :with => '1234')
    click_button('signup_button')
    visit('/')
    click_link('LOGIN')
    fill_in('email', :with => 'bob@bob.com')
    fill_in('password', :with => '1234')
    click_button('login_button')
    click_on('Katka')
    expect(page).to have_content('Send')
  end
  it "allows user to close chatbox" do
    user = User.create({:username => 'Katka', :email=> 'katka@katka.com', :password => '1234'})
    visit('/')
    click_link('SIGN UP')
    fill_in('signup_username', :with => 'Bobby')
    fill_in('signup_email', :with => 'bob@bob.com')
    fill_in('signup_password', :with => '1234')
    click_button('signup_button')
    visit('/')
    click_link('LOGIN')
    fill_in('email', :with => 'bob@bob.com')
    fill_in('password', :with => '1234')
    click_button('login_button')
    click_on('Katka')
    click_button('')
    expect(page).to have_no_content('Send')
  end
end

describe('logging out', {:type => :feature}) do
  it "allows existing user to log out" do
    visit('/')
    click_link('SIGN UP')
    fill_in('signup_username', :with => 'Bobby')
    fill_in('signup_email', :with => 'bob@bob.com')
    fill_in('signup_password', :with => '1234')
    click_button('signup_button')
    click_button('SIGN OUT')
    expect(page).to have_content('You have succesfully signed out')
  end
end
