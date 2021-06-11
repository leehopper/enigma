require_relative 'spec_helper'
require_relative '../lib/key'

describe Key do
  it 'exists with given key' do
    key = Key.new('01234')

    expect(key).to be_a(Key)
    expect(key.key).to eq('01234')
  end

  it 'creates instance of itself with random key' do
    rand_key = Key.unknown

    expect(rand_key).to be_a(Key)
  end

  it 'creates shift key' do
    key = Key.new('01234')

    expect(key.create_shift_key).to eq([01, 12, 23, 34])
  end

  it '.convert_to_integers' do 
    key = Key.new('01234')
    expected = key.convert_to_integers(['01', '12', '23', '34'])

    expect(expected).to eq([01, 12, 23, 34])
  end
end
