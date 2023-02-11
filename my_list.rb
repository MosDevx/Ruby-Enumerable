require './my_enumerable'

class MyList
  include MyEnumerable
  # @list = []

  def initialize(alist)
    @list = alist
  end

  def display
    @list.each { |a| puts a }
    # puts @list
  end

  def each(&block)
    if block_given?
      @list.each(&block)
    # block.call(@list)
    # can i use the above but now recieve an argument from the implementationsof any? / all? ... as a pram
    else
      to_enum(:each)
    end
  end
end

mylist = [1, 2, 3, 4, 5]

list = MyList.new(mylist)

list.all? { |x| x > 2 }
