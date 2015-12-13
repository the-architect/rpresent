require 'forwardable'

require_relative 'partial_path_builder'

module RPresent
  class Base

    extend Forwardable
    def_delegator :@path_builder, :template_name

    def initialize(object, view_context)
      @object       = object
      @view_context = view_context

      @path_builder          = PartialPathBuilder.new(@object)
      @presented_object_name = @object.class.name.underscore.downcase.to_sym

      define_convenience_accessor!
    end

    # renders a partial based on the represented objects name
    # passes in in some defaults you can use inside the partial:
    #   presenter - which is the
    def partial(path, options={})
      h.render(partial: template_name(path), locals: partial_defaults.merge(options) )
    end

    def unless_nil(content, &block)
      block.yield unless content.nil?
    end

    def h
      @view_context
    end

    private

    # convenience method so you can use "article" instead of "object"
    def define_convenience_accessor!
      self.class.send(:define_method, @presented_object_name) do
        @object
      end
    end

    def partial_defaults
      @partial_defaults ||= { presenter: self, @presented_object_name => @object }.freeze
    end

    def method_missing(*args, &block)
      @object.send(*args, &block)
    rescue NoMethodError
      @view_context.send(*args, &block)
    end

  end

end
