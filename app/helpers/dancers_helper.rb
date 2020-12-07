module DancersHelper

    def check_image(dancer)
        image_tag (dancer.image), size: "100x80" unless dancer.image.attachment == nil 
    end
end
