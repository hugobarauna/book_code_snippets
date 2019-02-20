ApiClient = Class.new

class Weather
  def today
    weather_api_client = ApiClient.new

    case weather_api_client.today
    when "sunny"
      "good"
    end
  end
end

RSpec.describe Weather do
  describe "#today" do
    it "returns 'good' for a sunny day" do
      allow_any_instance_of(ApiClient)
        .to receive(:today)
        .and_return("sunny")

      weather = Weather.new

      expect(weather.today).to eq("good")
    end
  end
end
