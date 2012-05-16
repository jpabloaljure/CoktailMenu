require 'test_helper'

class CocktailsControllerTest < ActionController::TestCase
  setup do
    @cocktail = cocktails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cocktails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cocktail" do
    assert_difference('Cocktail.count') do
      post :create, :cocktail => { :description => @cocktail.description, :grade => @cocktail.grade, :name => @cocktail.name, :oficial => @cocktail.oficial, :prise => @cocktail.prise }
    end

    assert_redirected_to cocktail_path(assigns(:cocktail))
  end

  test "should show cocktail" do
    get :show, :id => @cocktail
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cocktail
    assert_response :success
  end

  test "should update cocktail" do
    put :update, :id => @cocktail, :cocktail => { :description => @cocktail.description, :grade => @cocktail.grade, :name => @cocktail.name, :oficial => @cocktail.oficial, :prise => @cocktail.prise }
    assert_redirected_to cocktail_path(assigns(:cocktail))
  end

  test "should destroy cocktail" do
    assert_difference('Cocktail.count', -1) do
      delete :destroy, :id => @cocktail
    end

    assert_redirected_to cocktails_path
  end
end
