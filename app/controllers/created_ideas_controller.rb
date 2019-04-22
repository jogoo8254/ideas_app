class CreatedIdeasController < ApplicationController
    before_action :authenticate_user!

    def create
        @idea = Idea.find(params[:idea_id])
        @created_idea = Created_idea.new created_idea_params
        @created_idea.idea = @idea
        @created_at.user = current_user
        if @created_idea.save
          redirect_to idea_path(@idea)
        else
           @created_ideas = @ideas.created_ideas.order(created_at: :desc)
           render 'ideas/show'
        end
      end
    
       def destroy
        @created_idea = Created_idea.find(params[:id])
        @created_idea.destroy
        redirect_to idea_path(@created_idea.idea)
      end
    
       private
    
       def created_idea_params
        params.require(:created_idea).permit(:body)
      end
end
