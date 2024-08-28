class Spec
  attr_accessor :session_successful
  attr_reader :describes

  def initialize
    @session_successful = true
    @describes = []
  end

  def self.describe(context_name)
    describes.push(Describe.new(context_name, get_block, 0))
  end

  # Currently, it's not possible to implement a true singleton, as access levels are not yet
  # implemented.
  #
  def self.instance
    @instance ||= Spec.new
  end

  def self.run
    instance.run
  end

  def self.describes
    instance.describes
  end

  def run
    @describes.each do |describe|
      describe.run
    end

    if Spec.instance.session_successful
      exit
    else
      exit(1)
    end
  end
end

class Describe
  attr_reader :context_name, :examples

  def initialize(context_name, block, indentation)
    @indentation = indentation
    @context_name = context_name
    @describes = []
    @examples = []
    @before_hooks = []
    @after_hooks = []
    instance_eval block
  end

  def describe(context_name)
    describes.push(Describe.new(context_name, get_block, @indentation + 2))
  end

  def it(context_name)
    examples.push(Example.new(context_name, get_block, @indentation + 2))
  end

  def before
    @before_hooks.push(get_block)
  end

  def after
    @after_hooks.push(get_block)
  end

  def run
    run_specs
    describes.each do |describe_node|
      describe_node.run
    end
  end

  def run_specs
    puts " " * @indentation + context_name.to_s
    examples.each do |example_node|
      @before_hooks.each do |before_hook|
        before_hook.call
      end

      example_node.run

      @after_hooks.each do |after_hook|
        after_hook.call
      end
      example_node.print_result
    end
  end

  attr_accessor :describes
end

class Example
  attr_reader :context_name, :test_result, :subject

  def initialize(context_name, block, indentation)
    @indentation = indentation
    @context_name = context_name
    @test_result = true
    @block = block
  end

  def run
    instance_eval @block
  end

  def expect(subject)
    @subject = subject
    self
  end

  def to(expectation)
    @test_result = expectation.call(subject)
  end

  def not_to(expectation)
    @test_result = !expectation.call(subject)
  end

  def eq(expectation)
    Block.new do |n|
      @actual = n
      @expect = expectation
      n == expectation
    end
  end

  def print_result
    result_output = String.fmt("%sit \"%s\"", " " * @indentation, context_name.to_s)
    if !test_result
      result_output += " (FAILED)"
      result_output += String.fmt("\n  expect: %s\n  actual: %s", @expect, @actual)
      Spec.instance.session_successful = false
    end
    puts(result_output)
  end
end
