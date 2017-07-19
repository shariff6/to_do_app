require("spec_helper")

  describe('adding a new list', {:type => :feature}) do
    it('allows a user to click a list to see the tasks and details for it') do
      visit('/')
      fill_in('name', :with =>'Moringaschool Work')
      click_button('addList')
      expect(page).to have_content('Success!')
    end
  end
  describe('viewing all of the lists', {:type => :feature}) do
      it('allows a user to see all of the lists that have been created') do
        list = List.new('Moringaschool Homework', 1)
        list.save()
        visit('/')
        expect(page).to have_content(list.name)
      end
    end
    describe('seeing details for a single list', {:type => :feature}) do
  it('allows a user to click a list to see the tasks and details for it') do
    test_list = List.new('School stuff', 1)
    test_list.save()
    test_task = Task.new("learn SQL", test_list.id())
    test_task.save()
    visit('/lists')
    click_link(test_list.name())
    expect(page).to have_content(test_task.description())
  end
end
describe("#tasks") do
      it("returns an array of tasks for that list") do
        test_list = List.new("Moringaschool stuff",nil)
        test_list.save()
        test_task = Task.new("Learn SQL", test_list.id())
        test_task.save()
        test_task2 = Task.new("Review Ruby", test_list.id())
        test_task2.save()
        expect(test_list.tasks()).to(eq([test_task, test_task2]))
      end
    end
