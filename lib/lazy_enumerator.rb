# Wrapper class for implementing enumerators, whose blocks are not executed
# unless required.
# This is useful for sets that can't be fully enumerated (eg. because they're
# too slow), and that are typically only partially enumerated and then halted.
#
# Chaining is supported, for the methods `#each` and `#map`.
#
# Basic example:
#
#   [0, 1, 2].lazy.map { |i| puts "Iterated: #{i}"; i }.first(2)
#   Iterated: 0
#   Iterated: 1
#   => [0, 1]
#
# Chaining example:
#
#   [0, 1, 2].lazy.map { |i| puts "It.1: #{i}"; i }.map { |i| puts "It.2: #{i}"; 2 * i}.first(2)
#   It.1: 0
#   It.2: 0
#   It.1: 1
#   It.2: 1
#   => [0, 2]
#
class LazyEnumerator

  # Instantiate a LazyEnumerator.
  #
  # parent: wrapped class.
  # block: pass a block to chain it.
  #
  def initialize(parent)
    @parent = parent

    if block_given?
      @enumerator_block = get_block
    end
  end

  def each
    while has_next? do
      next_value = self.next
      yield next_value
    end
  end

  def map
    # Workaround for pluto's lack of &block support.
    LazyEnumerator.new(self) do |value|
      yield(value)
    end
  end

  # Returns true if there is another element is available.
  #
  def has_next?
    # The first stopping parent will stop the entire chain.
    @parent.has_next?
  end

  # Returns the next element, and advances the internal position.
  #
  # Raises an error if there are no elements available.
  #
  def next
    result = @parent.next

    # When instantiating the root LazyIterator, there is generally no block.
    if @enumerator_block
      result = @enumerator_block.call(result)
    end

    result
  end

  # Returns the first (`size`) elements.
  #
  def first(size)
    # We need not to perform a number of :each cycles exactly the number of times required.
    # If the size is 0, we can't enter the block, so we break immediately.
    if size == 0
      return []
    end

    result = []

    each do |value|
      result.push(value)

      if result.length >= size
        break
      end
    end

    result
  end
end
