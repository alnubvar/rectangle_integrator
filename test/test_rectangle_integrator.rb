# frozen_string_literal: true

require "test_helper"
require "minitest/autorun"
#require 'test/unit/ui/console/testrunner'
require_relative "lib/rectangle_integrator"
class TestRectangleIntegrator < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RectangleIntegrator::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

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
