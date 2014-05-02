require 'spec_helper'

describe Task do

  let(:user)     { FactoryGirl.build :user }
  let(:template) { FactoryGirl.build :template, author: user }

  let(:task) do
    FactoryGirl.build :task,
      name: "My unicorn task",
      hours: 5,
      rate: 400,
      template: template
  end

   let(:subtask) do
    FactoryGirl.build :task,
      name: "My unicorn sub task",
      hours: 10,
      parent: task
  end

  context "When name is not present" do

    it "is invalid" do
      task.name = " "
      expect(task).to_not be_valid
    end
  end

  describe ".hours" do

    context "When there is subtasks" do

      it "returns the sum of all subtasks" do
        # TODO
      end
    end
  end

  describe ".project" do

    context "When parent task has a template" do

      it "returns the template" do
        expect(subtask.project).to eq(template)
      end
    end

    context "When top parent task has an estimate" do

      let(:estimate)   { FactoryGirl.build :estimate, author: user }
      let(:subsubtask) { FactoryGirl.build :task, parent: subtask }
      
      it "returns the estimate" do
        task.estimate = estimate
        expect(subsubtask.project).to eq(estimate)
      end
    end
  end
end
