require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_registration_url
    assert_response :success
  end

  test "should create user with valid params" do
    assert_difference "User.count", 1 do
      post registration_url, params: {
        user: {
          email_address: "new-user@example.com",
          password: "password123",
          password_confirmation: "password123"
        }
      }
    end
    assert_redirected_to root_url
  end

  test "should not create user with mismatched password confirmation" do
    assert_no_difference "User.count" do
      post registration_url, params: {
        user: {
          email_address: "another-user@example.com",
          password: "password123",
          password_confirmation: "wrong"
        }
      }
    end
    assert_response :unprocessable_content
  end
end
