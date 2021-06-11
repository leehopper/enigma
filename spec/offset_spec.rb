require_relative 'spec_helper'
require_relative '../lib/offset'

describe Offset do
  it 'exists' do
    offset = Offset.new('061121')

    expect(offset).to be_a(Offset)
  end

  it 'attributes' do
    offset = Offset.new('061121')

    expect(offset.date).to eq('061121')
  end

  it '.create_shift_offset' do
    offset = Offset.new('061121')

    expect(offset.create_shift_offset).to eq(['6', '6', '4', '1'])
  end
end
