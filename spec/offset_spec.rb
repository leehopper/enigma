require_relative 'spec_helper'
require_relative '../lib/offset'

describe Offset do
  it 'exists' do
    offset = Offset.new('061121')

    expect(offset).to be_a(Offset)
  end

  it 'attributes' do
    offset = Offset.new('110621')

    expect(offset.date).to eq('110621')
  end

  it 'creates instance of self without date argument' do
    offset = Offset.unknown

    expect(offset).to be_a(Offset)
  end

  it '.translate_date' do
    offset = Offset.new('110621')

    expect(offset.translate_date).to eq("12237005641")
  end

  it '.create_shift_offset' do
    offset = Offset.new('110621')

    expect(offset.create_shift_offset).to eq(['5', '6', '4', '1'])
  end
end
