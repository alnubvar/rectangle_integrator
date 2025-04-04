# frozen_string_literal: true

require_relative "triangle_integrator/version"

module TriangleIntegrator
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


  
  end
  