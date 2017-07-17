require ("rspec")
require("to_do_list")
require('pg')

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
  end
end
describe(Task) do
describe("#description") do
  it ("lets you read te tasks") do
    test_task = Task.new("wash dishes")
    expect(test_task.description()).to(eq("wash dishes"))
  end
end
describe("#save") do
  it("adds a task to the array of saved tasks") do
    test_task = Task.new("wash the lion")
    test_task.save()
    expect(Task.all()).to(eq([test_task]))
  end
end
describe(".clear") do
  it("empties out all of the saved tasks") do
    Task.new("wash the lion").save()
    Task.clear()
    expect(Task.all()).to(eq([]))
  end
end
describe("#==") do
  it("is the same task if it has the same description") do
    task1 = Task.new({:description => "learn SQL"})
    task2 = Task.new({:description => "learn SQL"})
    expect(task1).to(eq(task2))
  end
end
describe(".all") do
  it("is empty at first") do
    expect(Task.all()).to(eq([]))
  end
end
end
