# frozen_string_literal: true


module RectangleIntegrator
  module ErrorEstimator

    def self.left_rectangle_error(f, a, b, n, samples: 1000)
      h = (b - a) / samples.to_f
      max_derivative = (0..samples).map do |i|
        x = a + i * h
        (f.call(x + 1e-5) - f.call(x - 1e-5)) / (2e-5)
      end.map(&:abs).max
      ((b - a)**2 / (2.0 * n)) * max_derivative
    end

    def self.right_rectangle_error(f, a, b, n, samples: 1000)
      h = (b - a) / samples.to_f
      max_derivative = (0..samples).map do |i|
        x = a + i * h
        (f.call(x + 1e-5) - f.call(x - 1e-5)) / (2e-5)
      end.map(&:abs).max
      ((b - a)**2 / (2.0 * n)) * max_derivative
    end

    def self.midpoint_rectangle_error(f, a, b, n, samples: 1000)
      h = (b - a) / samples.to_f
      max_second_derivative = (0..samples).map do |i|
        x = a + i * h
        (f.call(x - 1e-5) - 2 * f.call(x) + f.call(x + 1e-5)) / (1e-5**2)
      end.map(&:abs).max
      ((b - a)**3 / (24.0 * n**2)) * max_second_derivative
    end
  end
end
