require 'rails_helper'

describe TodosController, :type => :controller do
  describe "JSON" do
    it "get todos json" do
      get :index, {}, { "Accept" => "application/json" }
    end

    it "post todos json" do
      post :create, :todo => {description: 'Test', completed: false}, format: 'json'
    end

    it "update todos json" do
      todo = Todo.create(description: "Test", completed: false)
      todo.save
      put :update, :id => todo.id, :todo => {completed: true}, format: 'json'
    end
  
    it "delete todos json" do
      todo = Todo.create(description: "Test", completed: false)
      todo.save
      delete :destroy, :id => todo.id, format: 'json'
    end

  end
end
