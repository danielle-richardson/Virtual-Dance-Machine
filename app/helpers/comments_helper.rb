module CommentsHelper

    def display_header(comment)
        if params[:dance_class_id]
            content_tag(:h1, "Add a Comment for #{comment.dance_class.type} -  #{comment.dance_class.category.name}")
        else
          content_tag(:h1, "Create a comment")
        end
      end
end
