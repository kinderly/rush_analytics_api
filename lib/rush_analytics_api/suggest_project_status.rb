module RushAnalyticsApi
  class SuggestProjectStatus
    ACTION = :rushapi__suggest_project_status

    def initialize(session_id)
      @session_id = session_id
    end

    def call(api_key = nil)
      res = Request.new(ACTION, api_key, session_id: @session_id).call
      res.body[:rushapi__suggest_project_status_response][:return]
    end
  end
end
