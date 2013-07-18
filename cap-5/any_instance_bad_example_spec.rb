class ApiClient; end

class Weather
  def initialize(api_client)
    @weather_api_client = api_client
  end

  def today
    case @weather_api_client.today
    when "sunny"
      "good"
    end
  end
end

describe Weather do
  describe "#today" do
    it "returns 'good' for a sunny day" do
      api_client = ApiClient.new
      allow(api_client).to receive(:today).and_return("sunny")
      weather = Weather.new(api_client)

      expect(weather.today).to eq("good")
    end
  end
end
