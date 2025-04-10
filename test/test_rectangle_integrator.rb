# frozen_string_literal: true

require "test_helper"
class TestRectangleIntegrator < Minitest::Test
  include RectangleIntegrator
  
  def test_left_rectangle
    integrator = IntegralSolver.new(->(x) { x**2 }, 0, 1)
    result = integrator.left_rectangle
    assert_equal  0, result
  end

  def test_right_rectangle
    integrator = IntegralSolver.new(->(x) { x**2 }, 0, 1)
    result = integrator.right_rectangle
    assert_equal  1, result
  end

  def test_average_rectangle
    integrator = IntegralSolver.new(->(x) { x**2 }, 0, 1)
    result = integrator.average_rectangle
    assert_equal  0.25, result
  end

  def test_zero_interval
    integrator = IntegralSolver.new(-> (x) {x}, 0,0)
    result = integrator.average_rectangle
    assert_equal 0, result
  end

  def test_wrong_interval
    assert_raises(ArgumentError) do
      IntegralSolver.new(-> (x) {x}, 5, 0)
    end
  end


#---------------------------------------------------------------------------------------------------
  def setup
    @linear_func = ->(x) { 2 * x }
    @quadratic_func = ->(x) { x**2 }
    @a = 0.0
    @b = 1.0
    @n = 100
  end

  
  def test_error_estimator_with_invalid_interval
    assert_raises(ArgumentError) do
      ErrorEstimator.left_rectangle_error(@linear_func, 5, 0, @n)
    end
  end


  def test_with_zero_divisions
    assert_raises(ZeroDivisionError) do
      ErrorEstimator.midpoint_rectangle_error(@quadratic_func, @a, @b, 0)
    end
  end


  def test_left_rectangle_error_linear_function
    error = ErrorEstimator.left_rectangle_error(@linear_func, @a, @b, @n)
    expected_error = ((@b - @a)**2 / (2.0 * @n)) * 2.0 
    assert_in_delta expected_error, error, 1e-6
  end


  def test_right_rectangle_error_linear_function
    error = ErrorEstimator.right_rectangle_error(@linear_func, @a, @b, @n)
    expected_error = ((@b - @a)**2 / (2.0 * @n)) * 2.0
    assert_in_delta expected_error, error, 1e-6
  end


  def test_midpoint_rectangle_error_quadratic_function
    error = ErrorEstimator.midpoint_rectangle_error(@quadratic_func, @a, @b, @n)
    expected_error = ((@b - @a)**3 / (24.0 * @n**2)) * 2.0
    assert_in_delta expected_error, error, 1e-6
  end
end
