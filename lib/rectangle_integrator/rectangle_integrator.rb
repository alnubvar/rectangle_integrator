# frozen_string_literal: true

require_relative "rectangle_integrator/version"

module RectangleIntegrator
  class Error < StandardError; end
  class RectangleIntegrator
    def initialize(func, a, b)
      @func = func
      @a = a
      @b = b
    end
  
    def left_rectangle
      (@b - @a)* @func.call(@a)
    end

    def right_rectangle
      (@b - @a)* @func.call(@b)
    end

    def average_rectangle
      (@b - @a)* @func.call((@a+@b)/2)
    end
  end
end
