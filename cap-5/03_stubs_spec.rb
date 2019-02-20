class LoanChecker
  def can_lend_to?(client)
    !client.has_debt?
  rescue
    nil
  end
end

class Client; end

RSpec.describe LoanChecker do
  describe "#can_lend_to?" do
    it "returns true when the client has no debt" do
      # setup
      client = Client.new
      allow(client).to receive(:has_debt?).and_return(false)
      loan_checker = LoanChecker.new

      # exercise
      loan_evaluation = loan_checker.can_lend_to?(client)

      # verify
      expect(loan_evaluation).to be_truthy
    end

    it "returns true when the client has no debt (using a double)" do
      client = double("client")
      allow(client).to receive(:has_debt?).and_return(false)
      loan_checker = LoanChecker.new

      loan_evaluation = loan_checker.can_lend_to?(client)

      expect(loan_evaluation).to be_truthy
    end

    it "returns nil when it's not possible to check the client's debt" do
      client = Client.new
      allow(client).to receive(:has_debt?).and_raise(RuntimeError)
      loan_checker = LoanChecker.new

      loan_evaluation = loan_checker.can_lend_to?(client)

      expect(loan_evaluation).to be_nil
    end
  end
end

RSpec.describe "RSpec stubs" do
  it "can stub with arguments contraints" do
    client = Client.new

    allow(client).to receive(:has_debt?).with(in: 2012).and_return(true)
    allow(client).to receive(:has_debt?).with(in: 2011).and_return(false)

    expect(client.has_debt?(in: 2012)).to be_truthy
    expect(client.has_debt?(in: 2011)).to be_falsey

    expect {
      expect(client.has_debt?)
    }.to raise_error(RSpec::Mocks::MockExpectationError)
  end

  it "can stub any instance of a class" do
    allow_any_instance_of(Client).to receive(:has_debt?).and_return(false)

    # com o stub acima, qualquer instância que você fizer da classe
    # Client vai responder a mensagem has_debt? com o retorno false
    client_instance = Client.new
    another_client_instance = Client.new

    expect(client_instance.has_debt?).to be_falsey
    expect(another_client_instance.has_debt?).to be_falsey
  end
end
