# frozen_string_literal: true

require_relative "version"

module RectangleIntegrator
  class Error < StandardError; end
  class RectangleIntegrator
    attr_reader :func, :a, :b
    
    def initialize(func, a, b)
      @func = func
      @a = a
      @b = b
      validate_interval
    end
    
    def left_rectangle
      (@b - @a) * func.call(a)
    end
  
    def right_rectangle
      (@b - @a) * func.call(b)
    end
  
    def average_rectangle
      midpoint = (a + b) / 2.0
      (@b - @a) * func.call(midpoint)
    end
    
    def a=(new_a)
      @a = new_a
      validate_interval
    end
    
    def b=(new_b)
      @b = new_b
      validate_interval
    end
    
    def validate_interval
      if a > b
        raise ArgumentError, "Wrong interval 'a' must be less then 'b'"
      end
    end
  end
end
