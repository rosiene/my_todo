require 'rails_helper'

describe Todo do
  describe "validation" do
    it "is invalid without a description" do
      todo = Todo.new(description: "")
      todo.valid?
      expect(todo.errors).to have_key(:description)
    end
  end
end
