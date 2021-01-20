require "minitest/autorun"
class Dog
  def initialize
    @storage = []
  end
  def give_bone(bone)
    if @storage.length >= 3
      "I have too many bones"
    else
      @storage.push(bone)
      @storage.length
    end
  end
  def eat_bone
    fed = @storage.pop
    "Yummy! I ate a #{fed} bone!"
  end
  def bone_count
    @storage.length
  end
end
describe Dog do
  describe ".give_bone" do
    it "adding a bone to dog's storage" do
      dog = Dog.new
      dog.give_bone("Small")
      _(dog.bone_count).must_equal(1)
    end
    describe ".eat_bone" do
      it "returning the last bone given and taking it out of storage" do
        dog = Dog.new
        dog.give_bone("Small")
        _(dog.eat_bone).must_equal("Yummy! I ate a Small bone!")
        _(dog.bone_count).must_equal(0)
      end
    end
    describe ".bone_count" do
      it "return the number of bones a dog has" do
        dog = Dog.new
        dog.give_bone("Small")
        dog.eat_bone
        _(dog.bone_count).must_equal(0)
      end
    end
  end
end
