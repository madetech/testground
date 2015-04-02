feature 'Home' do
  scenario 'Visting home' do
    when_a_user_visits_home
    then_they_should_be_welcomed
  end

  def when_a_user_visits_home
    visit root_path
  end

  def then_they_should_be_welcomed
    expect(page).to have_content(I18n.t('home.title'))
  end
end
