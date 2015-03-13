require 'test_helper'

class YearEndingOdometersControllerTest < ActionController::TestCase
  setup do
    @year_ending_odometer = year_ending_odometers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:year_ending_odometers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create year_ending_odometer" do
    assert_difference('YearEndingOdometer.count') do
      post :create, year_ending_odometer: { reading: @year_ending_odometer.reading, vehicle_id: @year_ending_odometer.vehicle_id, year: @year_ending_odometer.year }
    end

    assert_redirected_to year_ending_odometer_path(assigns(:year_ending_odometer))
  end

  test "should show year_ending_odometer" do
    get :show, id: @year_ending_odometer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @year_ending_odometer
    assert_response :success
  end

  test "should update year_ending_odometer" do
    patch :update, id: @year_ending_odometer, year_ending_odometer: { reading: @year_ending_odometer.reading, vehicle_id: @year_ending_odometer.vehicle_id, year: @year_ending_odometer.year }
    assert_redirected_to year_ending_odometer_path(assigns(:year_ending_odometer))
  end

  test "should destroy year_ending_odometer" do
    assert_difference('YearEndingOdometer.count', -1) do
      delete :destroy, id: @year_ending_odometer
    end

    assert_redirected_to year_ending_odometers_path
  end
end
