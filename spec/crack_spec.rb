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

  it '.rotate_alphabet' do
    crack = Crack.new('vjqtbeaweqihssi')

    expected = crack.rotate_alphabet(0)
    expect(expected[0]).to eq(' ')
    expect(expected[26]).to eq('z')

    expected = crack.rotate_alphabet(1)
    expect(expected[0]).to eq('e')
    expect(expected[26]).to eq('d')

    expected = crack.rotate_alphabet(2)
    expect(expected[0]).to eq('n')
    expect(expected[26]).to eq('m')

    expected = crack.rotate_alphabet(3)
    expect(expected[0]).to eq('d')
    expect(expected[26]).to eq('c')
  end

  it '.find_index_shift' do
    crack = Crack.new('vjqtbeaweqihssi')

    expect(crack.find_index_shift('h', 0)).to eq(8)
    expect(crack.find_index_shift('i', 3)).to eq(5)
  end

  it '.create_shift' do
    crack = Crack.new('vjqtbeaweqihssi')

    expect(crack.create_shift(['h', 's', 's', 'i'])).to eq([8, 14, 5, 5])
  end

  it '.crack_enigma' do
    crack = Crack.new('vjqtbeaweqihssi')

    expect(crack.crack_enigma).to eq([14, 5, 5, 8])

    crack = Crack.new('rwehpfnizzovfzoxvwrhked')

    expect(crack.crack_enigma).to eq([6, 18, 0, 8])
  end

  it '.rotate_shift' do
    crack = Crack.new('vjqtbeaweqihssi')
    split_array = ['v', 'j', 'q', 't', 'g']
    shift = ['1', '2', '3', '4']
    expected = ['4', '1', '2', '3']

    expect(crack.rotate_shift(split_array, shift)).to eq(expected)

    split_array = ['l', 'v', 'j', 'q', 't', 'g']
    shift = ['1', '2', '3', '4']
    expected = ['3', '4', '1', '2']

    expect(crack.rotate_shift(split_array, shift)).to eq(expected)

    split_array = ['e', 'l', 'v', 'j', 'q', 't', 'g']
    shift = ['1', '2', '3', '4']
    expected = ['2', '3', '4', '1']

    expect(crack.rotate_shift(split_array, shift)).to eq(expected)

    split_array = ['g', 'e', 'l', 'v', 'j', 'q', 't', 'g']
    shift = ['1', '2', '3', '4']
    expected = ['1', '2', '3', '4']

    expect(crack.rotate_shift(split_array, shift)).to eq(expected)
  end
end
