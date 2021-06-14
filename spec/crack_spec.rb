require_relative 'spec_helper'
require_relative '../lib/crack'

describe Crack do
  it 'exists' do
    crack = Crack.new('vjqtbeaweqihssi')

    expect(crack).to be_a(Crack)
  end

  it '.split_text' do
    crack = Crack.new('vjqt')

    expect(crack.split_text).to eq(['v', 'j', 'q', 't'])
  end

  it '.create_end_array' do
    crack = Crack.new('vjqtbeaweqihssi')
    expected = crack.create_end_array(crack.split_text)

    expect(expected).to eq(['h', 's', 's', 'i'])
  end
end
