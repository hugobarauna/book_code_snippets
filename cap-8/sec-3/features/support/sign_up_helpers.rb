module SignUpHelpers
  def sign_up_as(user)
    visit '/signup'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    fill_in 'Confirmação de senha', with: user.password
    click_button 'Criar conta'
  end

  def build_new_user
    User.new(
      email: 'email.qualquer@gmail.com',
      password: '12345678'
    )
  end
end

World(SignUpHelpers)
