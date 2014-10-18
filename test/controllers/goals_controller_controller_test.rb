require 'test_helper'

class GoalsControllerControllerTest < ActionController::TestCase
  test "should create #goal with nested #motivation attributes" do
    goal_params = {
        "goal"=>
           {
              "category_id"=>"1", "title"=>"TestSport",
              "motivations_attributes"=>{
                "0"=>{
                  "title"=>"TestSportTestSport",
                  "description"=>"TestSportTestSportTestSport",
                  "source"=>"TestSportTestSportTestSportTestSportTestSport"
                }
              }
           }
    }
    post :create, params: goal_params
    assert_response :success
  end

end
