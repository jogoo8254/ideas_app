class IdeasController < ApplicationController
    def index
        @ideas = Idea.all.order(created_at: :desc)
    end
    def new
        @idea = Idea.new
    end

    def create
        idea_params = params.require(:idea).permit(:title, :body)
        @idea = Idea.new idea_params
        if @idea.save
            redirect_to idea_path(@idea.id)
            # render text: "Idea created successfully"
        else
            render :new
        end
    end
    def show
        @idea = Idea.find params[:id]
    end
    def edit
        @idea = Idea.find params[:id]        
    end
    def update
        @idea = Idea.find(params[:id])
        idea_params = params.require(:idea).permit(:title, :body)
        if @idea.update idea_params
            redirect_to idea_path(@idea.id)
        else
            render :edit
        end
    end
    def destroy
        idea = Idea.find params[:id]
        idea.destroy
        redirect_to root_path
    end
end
