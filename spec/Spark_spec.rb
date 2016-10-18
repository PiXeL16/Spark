require "spec_helper"

module Spark
  describe Spark do

    before do
      @output = StringIO.new
      @spark = Spark.new(out: @output)
    end

    describe '#initialize'
    it 'initialize without verbose' do
      expect(@spark.verbose).to be false
    end

    it 'has a version number' do
      expect(VERSION).not_to be nil
    end

    it 'can be set to verbose' do
      @spark =  Spark.new(verbose: true)
      expect(@spark.verbose).to be true
    end

    it 'shows error message' do
      @spark.error('This is an error')
      expect(@output.string).to include('This is an error')
    end
  end
end
