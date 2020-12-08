class CommentsController < ApplicationController
    before_action :require_login
    before_action :set_comment, only: [:edit, :show]

    def new
        if @dance_class = DanceClass.find_by_id(params[:dance_class_id])
            @comment = @dance_class.comments.build
          else
            @comment = Comment.new
          end
    end

    def create
        @comment = Comment.new(comments_params)
        @comment.dancer_id = session[:dancer_id]
        if @comment.save
            redirect_to dance_classes_path
        else
            render :new
        end 
    end 
      
    def show
    end 

    def edit
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
    
    def comments_params
        params.require(:comment).permit(:dance_class_id, :title, :content)
    end

    def set_comment
        @comment = Comment.find_by(id: params[:id])
    end

end
