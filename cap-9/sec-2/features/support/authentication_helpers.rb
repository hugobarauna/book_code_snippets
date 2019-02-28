class User
  def self.find_or_create_by!(*)
    new
  end

  def email; end
  def password; end
end

def visit(*); end
def fill_in(*); end
def click_button(*); end

module AuthenticationHelpers
  def sign_in(email = "user@example.org")
    user = User.find_or_create_by!(email: email) do |user|
             user.password = "123456"
           end

    visit "login"

    fill_in "Email", with: user.email
    fill_in "Senha", with: user.password
    click_button "Logar"
  end
end

World(AuthenticationHelpers)
