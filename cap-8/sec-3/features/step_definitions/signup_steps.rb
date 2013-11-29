# Step definitions with too much logic
#Quando(/^eu crio uma conta$/) do
  #visit '/signup'
  #fill_in 'Email', with: 'email.qualquer@gmail.com'
  #fill_in 'Senha', with: '12345678'
  #fill_in 'Confirmação de senha', with: '12345678'
  #click_button 'Criar conta'
#end

#Então(/^devo receber um email de notificação$/) do
  #sent_emails = ActionMailer::Base.deliveries
  #last_email = sent_emails.last
  #expect(last_email.to).to eq 'email.qualquer@gmail.com'
#end

# Refactored step definitions
Quando(/^eu crio uma conta$/) do
  @i = build_new_user
  sign_up_as @i
end

Então(/^devo receber um email de notificação$/) do
  expect(last_sent_email.to).to eq @i.email
end
