class IdeasController < ApplicationController
    before_action :find_idea, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index
        @ideas = Idea.all.order(created_at: :desc)
    end
    def new
        @idea = Idea.new
    end

    def create
        # idea_params = params.require(:idea).permit(:title, :body)
        @idea = Idea.new idea_params
        if @idea.save
            redirect_to idea_path(@idea.id)
            # render text: "Idea created successfully"
        else
            render :new
        end
    end
    def show
        # @idea = Idea.find params[:id]
        @created_idea = Created_idea.new
        @created_ideas = @idea.created_ideas.order(created_at: :desc)
    end
    def edit
        # @idea = Idea.find params[:id]        
    end
    def update
        # @idea = Idea.find(params[:id])
        # idea_params = params.require(:idea).permit(:title, :body)
        if @idea.update idea_params
            redirect_to idea_path(@idea.id)
        else
            render :edit
        end
    end
    def destroy
        # idea = Idea.find params[:id]
        idea.destroy
        redirect_to root_path
    end

    private
    def idea_params
        params.require(:idea).permit(:title,:description)
    end

    def find_idea
        @idea = Idea.find(params[:id])        
    end
end
