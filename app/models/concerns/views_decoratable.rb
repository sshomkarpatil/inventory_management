module ViewsDecoratable

  extend ActiveSupport::Concern

  included do
    def decorated_view_object
      "Views::#{self.class.to_s}Decorator".constantize.new(self)
    end
  end

end
