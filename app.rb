require("sinatra")
  require("sinatra/reloader")
  also_reload("lib/**/*.rb")
  require("./lib/to_do_list")
  require("./lib/list")
  require('pg')

  DB = PG.connect({:dbname => "to_do"})
  get("/") do
    @tasks = Task.all()
    @lists = List.all()
    erb(:index)
  end
  post("/lists") do
    name = params.fetch("name")
    list = List.new(name, nil)
    list.save
    erb(:success)
  end
  get('/lists') do
    @lists = List.all()
    @tasks = Task.all()
    erb(:lists)
  end
  post("/tasks") do
      @lists = List.all()
      description = params.fetch("description")
      list_id = params.fetch("list_id").to_i()
      @list = List.find(list_id)
      @task = Task.new(description, list_id)
      @task.save()
      erb(:index)
    end
  get("/lists/:id") do
   @lists = List.all()
   @list = List.find(params.fetch("id").to_i())
   @tasks = Task.all()
   erb(:list)
 end
 get("/lists/:id/edit") do
    @list = List.find(params.fetch("id").to_i())
    erb(:list_edit)
  end

  patch("/lists/:id") do
    name = params.fetch("name")
    @list = List.find(params.fetch("id").to_i())
    @list.update({:name => name})
    erb(:list)
  end
  delete("/lists/:id") do
    @list = List.find(params.fetch("id").to_i())
    @list.delete()
    @lists = List.all()
    erb(:index)
  end
