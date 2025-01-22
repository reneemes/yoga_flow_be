class YogaGateway

  def self.get_poses
    conn = Faraday.new(url: "https://yoga-api-nzy4.onrender.com/v1")
    response = conn.get("poses")
    # if response.status != 200
    #   raise "Unable to connect to the Yoga Database"
    # end
    json = JSON.parse(response.body, symbolize_names: true)
  end

end
