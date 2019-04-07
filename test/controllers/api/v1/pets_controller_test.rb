require 'test_helper'

class Api::V1::PetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_pet = api_v1_pets(:one)
  end

  test "should get index" do
    get api_v1_pets_url, as: :json
    assert_response :success
  end

  test "should create api_v1_pet" do
    assert_difference('Api::V1::Pet.count') do
      post api_v1_pets_url, params: { api_v1_pet: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_pet" do
    get api_v1_pet_url(@api_v1_pet), as: :json
    assert_response :success
  end

  test "should update api_v1_pet" do
    patch api_v1_pet_url(@api_v1_pet), params: { api_v1_pet: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_pet" do
    assert_difference('Api::V1::Pet.count', -1) do
      delete api_v1_pet_url(@api_v1_pet), as: :json
    end

    assert_response 204
  end
end
