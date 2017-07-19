require "spec_helper"
  describe(List) do
    describe(".all") do
      it("starts off with no lists") do
        expect(List.all()).to(eq([]))
      end
    end

    describe("#name") do
      it("tells you its name") do
        list = List.new("moringaschool stuff", nil)
        expect(list.name()).to(eq("moringaschool stuff"))
      end
    end

    describe("#id") do
      it("sets its ID when you save it") do
        list = List.new("moringaschool stuff", nil)
        list.save()
        expect(list.id()).to(be_an_instance_of(Fixnum))
      end
    end

    describe("#save") do
      it("lets you save lists to the database") do
        list = List.new("moringaschool stuff", nil)
        list.save()
        expect(List.all()).to(eq([list]))
      end
    end

    describe("#==") do
      it("is the same list if it has the same name") do
        list1 = List.new("moringaschool stuff",nil)
        list2 = List.new("moringaschool stuff", nil)
        expect(list1).to(eq(list2))
      end
    end
    describe(".find") do
    it("returns a list by its ID") do
      test_list = List.new("Moringaschool stuff", nil)
      test_list.save()
      test_list2 = List.new("Home stuff",nil)
      test_list2.save()
      expect(List.find(test_list2.id())).to(eq(test_list2))
    end
  end
  describe("#update") do
      it("lets you update lists in the database") do
        list = List.new("Moringa School stuff", nil)
        list.save()
        list.update("Homework stuff")
        expect(list.name()).to(eq("Homework stuff"))
      end
    end
    describe("#delete") do
      it("lets you delete a list from the database") do
        list = List.new("Moringa School stuff", nil)
        list.save()
        list2 = List.new("House stuff", nil)
        list2.save()
        list.delete()
        expect(List.all()).to(eq([list2]))
      end
      it("deletes a list's tasks from the database") do
       list = List.new("Moringa School stuff", nil)
       list.save()
       task = Task.new("learn SQL", list.id())
       task.save()
       task2 = Task.new("Review Ruby", list.id())
       task2.save()
       list.delete()
      expect(Task.all()).to(eq([]))
     end
    end
  end
