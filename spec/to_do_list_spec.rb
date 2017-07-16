require ("rspec")
require("to_do_list")
require('pg')

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
