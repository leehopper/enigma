require_relative 'spec_helper'
require_relative '../lib/key'

describe Key do
  it 'exists with given key' do
    key = Key.new('01234')

    expect(key).to be_a(Key)
    expect(key.key).to eq('01234')
  end

  it '.generate_key' do
    allow_any_instance_of(Key).to receive(:rand).and_return(1)
    rand_key = Key.new('none')

    expect(rand_key).to be_a(Key)
    expect(rand_key.key).to eq('11111')
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

  it '.convert_key_shift' do
    key = Key.new('cracking')
    key.convert_key_shift([3, 8, 1, 4])

    expect(key.key).to eq('03558')

    key = Key.new('none')
    key.convert_key_shift([38, 89, 95, 56])

    expect(key.key).to eq('38956')
  end

  it '.find_num' do
    key = Key.new('cracking')
    
    expect(key.find_num(03, 8)).to eq(35)
    # expect(key.find_num(03, 38)).to eq("restart")
  end
end
