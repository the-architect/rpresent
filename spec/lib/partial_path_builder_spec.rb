require_relative '../spec_helper'

describe RPresent::PartialPathBuilder do

  let(:object) { TestObject.new }
  let(:builder){ RPresent::PartialPathBuilder.new(object) }

  it 'absolute partial path' do
    expect(builder.template_name('/test')).to eql '/test'
  end

  it 'default partial path' do
    expect(builder.template_name('test')).to eql 'test_object/presenter/test'
  end

end
