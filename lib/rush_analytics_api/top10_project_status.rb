module RushAnalyticsApi
  class Top10ProjectStatus
    ACTION = :rushapi__top10_project_status

    def initialize(session_id)
      @session_id = session_id
    end

    def call(api_key = nil)
      res = Request.new(ACTION, api_key, session_id: @session_id).call
      res.body[:rushapi__top10_project_status_response][:return]
    end
  end
end
