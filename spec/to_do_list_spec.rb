require ("rspec")
require("to_do_list")

describe("#description") do
  it ("lets you read te tasks") do
    test_task = Task.new("wash dishes")
    expect(test_task.description()).to(eq("wash dishes"))
  end
end
