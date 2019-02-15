module Publishable
  attr_reader :published_on

  def publish!
    today = Time.now.strftime("%Y-%m-%d")
    @published_on = today
  end
end

class PublishableObject
  include Publishable
end

RSpec.shared_examples_for "a publishable object" do
  describe "#publish!" do
    it "saves the publication date" do
      subject.publish!

      today = Time.now.strftime("%Y-%m-%d")
      expect(subject.published_on).to eq(today)
    end
  end
end

RSpec.describe "A published object" do
  subject { PublishableObject.new }

  describe "#publish!" do
    it "saves the publication date" do
      subject.publish!

      today = Time.now.strftime("%Y-%m-%d")
      expect(subject.published_on).to eq(today)
    end
  end
end

RSpec.describe "A published object" do
  subject { PublishableObject.new }

  include_examples "a publishable object"
end

class BlogPost
  include Publishable
end

RSpec.describe BlogPost do
  it_behaves_like "a publishable object"
end

class Paper
  include Publishable
end

RSpec.describe Paper do
  it_behaves_like "a publishable object"
end
