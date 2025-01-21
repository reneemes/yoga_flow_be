class YogaGateway

  def self.get_poses
    conn = Faraday.new(url: "https://yoga-api-nzy4.onrender.com/v1")
    response = conn.get("poses")

    if response.status != 200
      raise "Unable to fetch yoga poses."
    end

    json = JSON.parse(response.body, symbolize_names: true)#[:results]
    # require 'pry'; binding.pry
    # json.map { |pose_data| Pose.new(pose_data) }
  end

end
