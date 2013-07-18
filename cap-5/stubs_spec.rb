class LoanChecker
  def can_lend_to?(client)
    not client.has_debt?
  rescue
    nil
  end
end

class Client; end

describe LoanChecker do
  describe "#can_lend_to?" do
    it "returns true when the client has no debt" do
      client = double("client")
      allow(client).to receive(:has_debt?).and_return(false)
      loan_checker = LoanChecker.new

      loan_evaluation = loan_checker.can_lend_to?(client)

      expect(loan_evaluation).to be_true
    end

    it "returns nil when it's not possible to check the client's debt" do
      client = Client.new
      allow(client).to receive(:has_debt?).and_raise(RuntimeError)
      loan_checker = LoanChecker.new

      loan_evaluation = loan_checker.can_lend_to?(client)

      expect(loan_evaluation).to be_nil
    end

    it "returns false when the client has any debt"
  end
end

describe "RSpec stubs" do
  it "can stub with arguments contraints" do
    client = Client.new

    allow(client).to receive(:has_debt?).with(in: 2012).and_return(false)
    allow(client).to receive(:has_debt?).with(in: 2011).and_return(true)

    expect(client.has_debt?(in: 2012)).to be_false
    expect(client.has_debt?(in: 2011)).to be_true

    expect {
     expect(client.has_debt?)
    }.to raise_error
  end

  it "can stub any instance of a class" do
    allow_any_instance_of(Client).to receive(:has_debt?).and_return(false)

    expect(Client.new.has_debt?).to be_false
    expect(Client.new.has_debt?).to be_false
  end
end
