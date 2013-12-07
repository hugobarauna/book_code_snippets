module AuthenticationHelpers
  def sign_in(email = 'user@example.org', password = '123456')
    user = User.find_by(email: email) or
            User.create!(email: email, password: password)

    visit 'login'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_button 'Logar'
  end
end

World(AuthenticationHelpers)
