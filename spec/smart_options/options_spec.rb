require "spec_helper"

describe SmartOptions::Options do
  class ExampleOptions < SmartOptions::Options
    option :encoding, default: 'utf-8'
    option :model, required: true
    option :skip_if_column_empty, default: false
    option :mapping, required: true
  end

  context "all options supplied" do
    subject do
      ExampleOptions.new(
        encoding: 1,
        model: 2,
        skip_if_column_empty: 3,
        mapping: 4
      )
    end

    it "assigns all options" do
      expect(subject.encoding).to eq(1)
      expect(subject.model).to eq(2)
      expect(subject.skip_if_column_empty).to eq(3)
      expect(subject.mapping).to eq(4)
    end
  end

  context "doesn't supply default option" do
    subject do
      ExampleOptions.new(
        model: 2,
        mapping: 4
      )
    end

    it "uses default value" do
      expect(subject.encoding).to eq('utf-8')
      expect(subject.skip_if_column_empty).to eq(false)
    end
  end

  context "required option is not supplied" do
    subject { ExampleOptions }

    it "raises an exception" do
      expect {
        subject.new()
      }.to raise_error("Missing required options: [:model, :mapping]")
    end

  end
end
