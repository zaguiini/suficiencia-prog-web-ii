require 'test_helper'

class ComandasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comanda = comandas(:one)
  end

  test "should get index" do
    get comandas_url, as: :json
    assert_response :success
  end

  test "should create comanda" do
    assert_difference('Comanda.count') do
      post comandas_url, params: { comanda: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show comanda" do
    get comanda_url(@comanda), as: :json
    assert_response :success
  end

  test "should update comanda" do
    patch comanda_url(@comanda), params: { comanda: {  } }, as: :json
    assert_response 200
  end

  test "should destroy comanda" do
    assert_difference('Comanda.count', -1) do
      delete comanda_url(@comanda), as: :json
    end

    assert_response 204
  end
end
