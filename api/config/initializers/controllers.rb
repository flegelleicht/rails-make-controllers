def make_controller(model_class)
  klass = Class.new(ApplicationController) do
    @@model_klass = model_class
    before_action :set_user, only: [:show, :update, :destroy]

    # GET /users
    def index
      @instances = @@model_klass.all

      render json: @instances
    end
  end

  class_name = "#{model_class.to_s}sController"
  puts "Making a(n) #{class_name}"
  Object.const_set(class_name, klass)
end

make_controller(Event)

