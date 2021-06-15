require_relative 'spec_helper'
require_relative '../lib/decryption'

describe Decryption do
  it 'exists' do
    decryption = Decryption.new('rwehpfnizzovfzoxvwr', '01234', '110621')

    expect(decryption).to be_a(Decryption)
  end

  it 'create_shift' do
    decryption = Decryption.new('rwehpfnizzovfzoxvwr', '01234', '110621')

    expect(decryption.create_shift).to eq([6, 18, 27, 35])
  end

  it '.reduce_shift' do
    decryption = Decryption.new('rwehpfnizzovfzoxvwr', '01234', '110621')
    decryption.create_shift
    expected = decryption.reduce_shift

    expect(expected).to eq([6, 18, 0, 8])
  end

  it '.split_text' do
    decryption = Decryption.new('rwehp', '01234', '110621')

    expect(decryption.split_text).to eq(['r', 'w', 'e', 'h', 'p'])
  end

  it '.decrypt_text' do
    decryption = Decryption.new('rwehp', '01234', '110621')
    decryption.create_shift
    decryption.reduce_shift
    expected = decryption.decrypt_text(['r', 'w', 'e', 'h', 'p'])

    expect(expected).to eq(['l', 'e', 'e', ' ', 'j'])
  end

  it '.decrypt_character' do
    decryption = Decryption.new('rwehp', '01234', '110621')

    expect(decryption.decrypt_character('r', 6)).to eq('l')
    expect(decryption.decrypt_character('!', 6)).to eq('!')
  end

  it '.format_text' do
    decryption = Decryption.new('rwehp', '01234', '110621')
    expected = decryption.format_text(['l', 'e', 'e', ' ', 'j'])

    expect(expected).to eq('lee j')
  end

  it '.create_output_hash' do
    decryption = Decryption.new('rwehp', '01234', '110621')
    expected = decryption.create_output_hash('lee j')
    expect(expected).to eq({
      decryption: 'lee j',
      key: '01234',
      date: '110621'
      })
  end

  it '.run_decryption' do
    decryption = Decryption.new('rwehpfnizzovfzoxvwr', '01234', '110621')


    expect(decryption.run_decryption).to eq({
      decryption: 'lee jonathon hopper',
      key: '01234',
      date: '110621'
      })
  end

  it '.find_shift_key' do
    decryption = Decryption.new('vjqtbeaweqihssi', 'none', 'none', [5, 8, 14, 5])

    expect(decryption.find_key_shift).to eq([0, 2, 10, 4])
  end

  it '.run_cracked_decryption' do
    decryption = Decryption.new('yqprel uhxhfvzh', 'none', '140621', [17, 12, 4, 6])

    expect(decryption.run_cracked_decryption).to eq({
      :date=>"140621",
      :decryption=>"hello world end",
      :key=>"66005"
      })

    decryption = Decryption.new('rwehpfnizzovfzoxvwrhked', 'none', '140621', [6, 18, 0, 8])

    expect(decryption.run_cracked_decryption).to eq({
      :date=>"140621",
      :decryption=>"lee jonathon hopper end",
      :key=>"01234"
      })
  end
end
