require "spec_helper"

feature "Estimate management" do

  before do
    @user     = FactoryGirl.create(:user, email: "unicorn@mail.com", password: "password")
    @estimate = FactoryGirl.create(:estimate, author: @user)
    @task     = FactoryGirl.create(:task, estimate: @estimate)
    @subtask  = FactoryGirl.create(:task, parent: @task)
    login(@user, "password")
  end

  let(:user)     { @user }
  let(:estimate) { @estimate }
  let(:task)     { @task }
  let(:subtask)  { @subtask }

  scenario "User creates a new project" do
    visit root_path
    click_link "New project"
    fill_in "estimate[project]", with: "My unicorn project"
    fill_in "estimate[description]", with: "My unicorn project description"
    click_button "Create project"
    expect(page).to have_text("This project has no tasks.")
  end

  scenario "User deletes a project" do
    visit estimate_path(estimate)
    click_link "Delete this project"
    expect(page).to have_text("Projects")
  end

  scenario "User creates a new task for project" do
    visit estimate_path(estimate)
    click_link "Create a new task for this project"
    fill_in "task[name]", with: "My unicorn task"
    click_button "Create Task"
    expect(page).to have_text("My unicorn task")
  end

  scenario "User creates a new sub task for project" do
    visit estimate_path(estimate)
    click_link "Split this task into sub tasks"
    fill_in "task[name]", with: "My unicorn sub task"
    click_button "Create Task"
    expect(page).to have_text("My unicorn sub task")
  end

  scenario "User tries to create a new task without a title" do
    visit estimate_path(estimate)
    click_link "Create a new task for this project"
    fill_in "task[name]", with: " "
    click_button "Create Task"
    expect(page).to have_text("Name can't be blank")
  end

  scenario "User deletes a task" do 
    visit estimate_path(estimate)
    expect(page).to have_text(task.name)
    expect(page).to have_text(subtask.name)
    click_link "Delete this task"
    expect(page).not_to have_text(task.name)
    expect(page).not_to have_text(subtask.name)
  end
end
