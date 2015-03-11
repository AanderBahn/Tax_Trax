require 'test_helper'

class FilingsControllerTest < ActionController::TestCase
  setup do
    @filing = filings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:filings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create filing" do
    assert_difference('Filing.count') do
      post :create, filing: { another_vehicle_personal: @filing.another_vehicle_personal, average_daily_commute: @filing.average_daily_commute, for_year: @filing.for_year, has_evidence: @filing.has_evidence, personal_use_off_duty: @filing.personal_use_off_duty, user_id: @filing.user_id, written_evidence: @filing.written_evidence, year_end_odometer: @filing.year_end_odometer }
    end

    assert_redirected_to filing_path(assigns(:filing))
  end

  test "should show filing" do
    get :show, id: @filing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @filing
    assert_response :success
  end

  test "should update filing" do
    patch :update, id: @filing, filing: { another_vehicle_personal: @filing.another_vehicle_personal, average_daily_commute: @filing.average_daily_commute, for_year: @filing.for_year, has_evidence: @filing.has_evidence, personal_use_off_duty: @filing.personal_use_off_duty, user_id: @filing.user_id, written_evidence: @filing.written_evidence, year_end_odometer: @filing.year_end_odometer }
    assert_redirected_to filing_path(assigns(:filing))
  end

  test "should destroy filing" do
    assert_difference('Filing.count', -1) do
      delete :destroy, id: @filing
    end

    assert_redirected_to filings_path
  end
end
