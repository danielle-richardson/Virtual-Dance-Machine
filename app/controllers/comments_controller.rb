class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new 
        if @dance_class = DanceClass.   find_by_id(params[:dance_class_id]
        @comment = @dance_class.comments.build
        else 
            @comment = Comment.new
        end 
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
    #how to I check if its nested & a valid id
        if @dance_class = DanceClass.find_by_id(params[:dance_class_id])
    #then its nested
            @comments = @dance_class.comments
        else
    #if its not nested
            @comments = Comment.all
        end 
    end

    private
    def comment_params
        params.require(:comment).permit(:dance_class_id, :content, :title)
    end

end
