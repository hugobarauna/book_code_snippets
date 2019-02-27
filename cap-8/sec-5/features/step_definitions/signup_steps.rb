# Step definitions with too much logic
# Quando("eu crio uma conta") do
#   # visita a página de cadastro
#   visit "/cadastro"

#   # preenche o formulário de cadastro
#   fill_in "Email", with: "email.qualquer@gmail.com"
#   fill_in "Senha", with: "12345678"
#   fill_in "Confirmação de senha", with: "12345678"

#   click_button "Criar conta"
# end

# Então("devo receber um email de notificação") do
#   # busca o último email enviado pela aplicação
#   sent_emails = ActionMailer::Base.deliveries
#   last_email = sent_emails.last

#   # verifica para quem foi enviado o último email
#   expect(last_email.to).to eq "email.qualquer@gmail.com"
# end

# Refactored step definitions
Quando("eu crio uma conta") do
  sign_up
end

Então("devo receber um email de notificação") do
  expect(last_sent_email.to).to eq "email.qualquer@gmail.com"
end
