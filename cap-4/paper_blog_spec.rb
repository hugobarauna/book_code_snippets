class Paper
  attr_reader :published_on

  def publish!
    today = Time.now.strftime("%Y-%m-%d")
    @published_on = today
  end
end

RSpec.describe Paper do
  describe "#publish!" do
    it "saves the publication date" do
      paper = Paper.new

      paper.publish!

      today = Time.now.strftime("%Y-%m-%d")
      expect(paper.published_on).to eq(today)
    end
  end
end

class BlogPost
  attr_reader :published_on

  def publish!
    today = Time.now.strftime("%Y-%m-%d")
    @published_on = today
  end
end

RSpec.describe BlogPost do
  describe "#publish!" do
    it "saves the publication date" do
      blog_post = BlogPost.new

      blog_post.publish!

      today = Time.now.strftime("%Y-%m-%d")
      expect(blog_post.published_on).to eq(today)
    end
  end
end
