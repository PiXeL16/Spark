require 'spec_helper'

describe Spark do

  before do
    @output = StringIO.new
    @spark = Spark::Fire.new(out: @output)
  end

  describe '#initialize'
  it 'initialize without verbose' do
    expect(@spark.verbose).to be false
  end

  it 'has a version number' do
    expect(Spark::VERSION).not_to be nil
  end

  it 'can be set to verbose' do
    @spark = Spark::Fire.new(verbose: true)
    expect(@spark.verbose).to be true
  end

  it 'shows error message' do
    @spark.error('This is an error')
    expect(@output.string).to include('This is an error')
  end

  it 'show info message' do
    @spark.info('This is an info message')
    expect(@output.string).to include('This is an info message')
  end

  it 'show success message' do
    @spark.success('This is an success message')
    expect(@output.string).to include('This is an success message')
  end

  it 'show important message' do
    @spark.important('This is an important message')
    expect(@output.string).to include('THIS IS AN IMPORTANT MESSAGE')
  end

  it 'shows regular message' do
    @spark.message('This is just a message')
    expect(@output.string).to include('This is just a message')
  end

  it 'shows a warning message' do
    @spark.warning('This is a warning message')
    expect(@output.string).to include('This is a warning message')
  end
end
