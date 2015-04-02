feature 'Account management' do
  let(:email) { Faker::Internet.email }
  let(:password) { email }

  scenario 'User sign up' do
    when_a_user_signs_up
    and_they_confirm_their_email
    then_they_should_be_able_to_login
  end

  scenario 'User login' do
    when_a_user_is_registered
    then_they_should_be_able_to_login
  end

  scenario 'User logout' do
    when_a_user_is_logged_in
    then_they_should_be_able_to_logout
  end

  def when_a_user_signs_up
    visit new_user_registration_path
    fill_in :user_email, with: email
    fill_in :user_password, with: password
    fill_in :user_password_confirmation, with: password
    click_button I18n.t('users.sign_up')
  end

  def and_they_confirm_their_email
    body = ActionMailer::Base.deliveries.first.body
    visit user_confirmation_path(confirmation_token: body.match(/confirmation_token=([^'"]+)/)[1])
  end

  def then_they_should_be_able_to_login
    visit new_user_session_path
    fill_in :user_email, with: email
    fill_in :user_password, with: password
    click_button I18n.t('users.login')
    expect(page).to have_content(email)
    expect(page).to have_content(I18n.t('users.logout'))
  end

  def when_a_user_is_registered
    create(:user, email: email, password: password)
  end

  def when_a_user_is_logged_in
    allow_any_instance_of(ApplicationController).to receive(:current_user) { create(:user) }
    visit root_path
  end

  def then_they_should_be_able_to_logout
    expect(page).to have_content(I18n.t('users.logout'))
    click_link I18n.t('users.logout')
  end
end
