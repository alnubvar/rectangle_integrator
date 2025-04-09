# frozen_string_literal: true

require_relative "version"
require_relative "error_estimator"

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

    def print_results(n)
      puts "Интегрирование на интервале [#{a}, #{b}] с #{n} прямоугольником(ами)"
      puts "-" * 50
      left = left_rectangle
      right = right_rectangle
      average = average_rectangle

      left_err = RectangleIntegrator::ErrorEstimator.left_rectangle_error(func, a, b, n)
      right_err = RectangleIntegrator::ErrorEstimator.right_rectangle_error(func, a, b, n)
      mid_err = RectangleIntegrator::ErrorEstimator.midpoint_rectangle_error(func, a, b, n)

      puts "Левый прямоугольник: #{left.round(10)} | Погрешность ≤ #{left_err.round(10)}"
      puts "Правый прямоугольник: #{right.round(10)} | Погрешность ≤ #{right_err.round(10)}"
      puts "Средний прямоугольник: #{average.round(10)} | Погрешность ≤ #{mid_err.round(10)}"
    end
  end
end
