class YogaGateway

  def self.get_one_pose(id)
    conn = Faraday.new(url: "https://yoga-api-nzy4.onrender.com/v1")
    response = conn.get("poses?id=#{id}")
    handle_response(response)
    json = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.handle_response(response)
    if response.status != 200
      raise "Unable to connect to the Yoga Database"
    end
  end
end
