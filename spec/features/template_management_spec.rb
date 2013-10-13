require "spec_helper"

feature "Template management" do

  before do
    @user = FactoryGirl.create(:user, email: "unicorn@mail.com", password: "password")
    @template = FactoryGirl.create(:project_type, user: @user)
    @task = FactoryGirl.create(:task, project_type: @template )
    login(@user, "password")
  end

  let(:user) { @user }
  let(:template) { @template }
  let(:task) { @task }

  scenario "User creates a new template" do
    visit settings_path
    click_link "New template"
    fill_in "project_type[name]", with: "My unicorn template"
    fill_in "project_type[description]", with: "My unicorn template description"
    click_button "Create project type"
    expect(page).to have_text("This project type has no tasks.")
  end

  scenario "User deletes a template" do
    visit project_type_path(template.id)
    click_link "Delete this project type"
    # Confirm dialogs are a little bit of pain
    # page.driver.browser.switch_to.alert.accept
    expect(page).to have_text("Settings")
  end

  # scenario "User creates a new task for project" do
  #   visit estimate_path(estimate.id)
  #   click_link "Create a new task for this project"
  #   fill_in "task[name]", with: "My unicorn task"
  #   click_button "Create Task"
  #   expect(page).to have_text("My unicorn task")
  # end

  # scenario "User tries to create a new task without a title" do
  #   visit estimate_path(estimate.id)
  #   click_link "Create a new task for this project"
  #   fill_in "task[name]", with: " "
  #   click_button "Create Task"
  #   expect(page).to have_text("Name can't be blank")
  # end

  # scenario "User deletes a task" do 
  #   visit estimate_path(estimate.id)
  #   click_link "Delete this task"
  #   expect(page).not_to have_text(task.name)
  # end
end
