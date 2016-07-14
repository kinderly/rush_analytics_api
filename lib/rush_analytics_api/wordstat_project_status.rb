module RushAnalyticsApi
  class WordstatProjectStatus
    ACTION = :rushapi__wordstat_project_status
    def initialize(session_id)
      @session_id = session_id
    end

    def call
      res = Request.new(ACTION, session_id: @session_id).call
      res.body[:rushapi__wordstat_project_status_response][:return]
    end
  end
end
