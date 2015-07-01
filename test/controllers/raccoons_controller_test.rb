require 'test_helper'

class RaccoonsControllerTest < ActionController::TestCase
  setup do
    @raccoon = raccoons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:raccoons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create raccoon" do
    assert_difference('Raccoon.count') do
      post :create, raccoon: { claw_ferocity: @raccoon.claw_ferocity, disposition: @raccoon.disposition, name: @raccoon.name }
    end

    assert_redirected_to raccoon_path(assigns(:raccoon))
  end

  test "should show raccoon" do
    get :show, id: @raccoon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @raccoon
    assert_response :success
  end

  test "should update raccoon" do
    patch :update, id: @raccoon, raccoon: { claw_ferocity: @raccoon.claw_ferocity, disposition: @raccoon.disposition, name: @raccoon.name }
    assert_redirected_to raccoon_path(assigns(:raccoon))
  end

  test "should destroy raccoon" do
    assert_difference('Raccoon.count', -1) do
      delete :destroy, id: @raccoon
    end

    assert_redirected_to raccoons_path
  end
end
