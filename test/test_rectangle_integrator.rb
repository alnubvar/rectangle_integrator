# frozen_string_literal: true

require "test_helper"

class TestRectangleIntegrator < Minitest::Test
  include RectangleIntegrator
  
  def test_left_rectangle
    integrator = RectangleIntegrator.new(->(x) { x**2 }, 0, 1)
    result = integrator.left_rectangle
    assert_equal  0, result
  end

  def test_right_rectangle
    integrator = RectangleIntegrator.new(->(x) { x**2 }, 0, 1)
    result = integrator.right_rectangle
    assert_equal  1, result
  end

  def test_average_rectangle
    integrator = RectangleIntegrator.new(->(x) { x**2 }, 0, 1)
    result = integrator.average_rectangle
    assert_equal  0.25, result
  end

  def test_zero_interval
    integrator = RectangleIntegrator.new(-> (x) {x}, 0,0)
    result = integrator.average_rectangle
    assert_equal 0, result
  end
end
