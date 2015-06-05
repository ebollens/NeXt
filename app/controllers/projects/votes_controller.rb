module Projects
  class VotesController < ApplicationController

    before_action do
      @project = Project.includes(:project_status).find(params[:project_id])
    end

    def create

      path = params[:return_to] ? params[:return_to] : project_path(@project)

      unless current_user
        raise Application::Error.new "You must be logged in to vote for a project",
                                     redirect_to: [
                                         auth_oauth2_launch_url(:shibboleth),
                                         flash: { return_to: path }
                                     ]
      end

      unless @project.has_been_voted_for_by? current_user
        vote = ProjectVote.new project: @project, user: current_user
      else
        vote = ProjectVote.where(project: @project, user: current_user).first
      end

      vote.participate = params[:participate]

      vote.save

      redirect_to path,
                  flash: {
                    page_alert: "Your support of <strong>#{@project.name}</strong> is appreciated!",
                    page_alert_type: 'success'
                  }

    end

  end
end
