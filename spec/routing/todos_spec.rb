require 'rails_helper'

describe TodosController do
  describe "routing" do

    it "routes to todos" do
      expect(:get => "/todos").to route_to("todos#index")
    end

    it "routes to create" do
      expect(:post => "/todos").to route_to("todos#create")
    end

    it "routes to update" do
      expect(:put => "/todos/1").to route_to("todos#update", :id => "1")
    end

    it "routes to destroy" do
      expect(:delete => "/todos/1").to route_to("todos#destroy", :id => "1")
    end

  end
end
