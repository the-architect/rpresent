module RPresent
  class PartialPathBuilder < Struct.new(:object)

    def template_name(path)
      path.chr == '/' ? path : template_path(path)
    end

    private

    def template_path(path)
      (root_path + [path]).join('/')
    end

    def root_path
      [object.class.table_name, 'presenter']
    end

  end
end
