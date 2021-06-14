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
end
