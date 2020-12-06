class CommentsController < ApplicationController
    def new 
        @dance_class = DanceClass.find_by_id(params[:dance_class_id]
        @comment = @dance_class.comments.build
    end 

    def create
        @comment = current_dancer.comments.build(comment_params)
        if @comment.save
            redirect_to comment_path(@comment)
        else
            render :new
        end 
    end 
      
    def show
        @comment = Comment.find_by_id(params[:id])
    end 
      

    def index
    end

    private
    def comment_params
        params.require(:comment).permit(:dance_class_id, :content, :title)
    end

end
