require_relative 'spec_helper'
require_relative '../lib/key'

describe Key do
  it 'exists with given key' do
    key = Key.new('01234')

    expect(key).to be_a(Key)
    expect(key.key).to eq('01234')
  end

  it '.generate_key' do
    allow_any_instance_of(Key).to receive(:rand).and_return(56789)
    rand_key = Key.new('none')

    expect(rand_key).to be_a(Key)
    expect(rand_key.key).to eq('56789')
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
