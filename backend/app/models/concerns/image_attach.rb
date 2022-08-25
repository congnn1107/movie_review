module ImageAttach
    extend ActiveSupport::Concern
    CLASS_ATTRS = { 'User' => 'avatar', 'Movie' => 'poster', 'Post' => 'cover'}

    def attach_an_image(image)
        self.send(CLASS_ATTRS[self.class.name]).attach(image) unless image.nil?
    end
end