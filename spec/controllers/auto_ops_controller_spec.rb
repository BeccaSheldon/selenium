require 'spec_helper'

describe AutoOpsController do

  describe "GET 'login'" do
    it "returns http success" do
      get 'login'
      response.should be_success
    end
  end

  describe "GET 'make_job'" do
    it "returns http success" do
      get 'make_job'
      response.should be_success
    end
  end

end
