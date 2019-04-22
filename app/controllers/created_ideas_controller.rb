class CreatedIdeasController < ApplicationController
    def create
        @idea = Idea.find(params[:idea_id])
        @created_idea = Created_idea.new created_idea_params
        @created_idea.idea = @idea
        if @created_idea.save
          redirect_to idea_path(@idea)
        else
    
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
