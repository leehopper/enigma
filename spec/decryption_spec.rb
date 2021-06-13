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
    expected = decryption.reduce_shift([6, 18, 27, 35])

    expect(expected).to eq([6, 18, 0, 8])
  end

  it '.split_and_downcase_text' do
    decryption = Decryption.new('rwehp', '01234', '110621')

    expect(decryption.split_text).to eq(['r', 'w', 'e', 'h', 'p'])
  end

  it '.decrypt_text' do
    decryption = Decryption.new('rwehp', '01234', '110621')
    expected = decryption.decrypt_text([6, 18, 0, 8], ['r', 'w', 'e', 'h', 'p'])

    expect(expected).to eq(['l', 'e', 'e', ' ', 'j'])
  end

  it '.decrypt_character' do
    decryption = Decryption.new('rwehp', '01234', '110621')

    expect(decryption.decrypt_character('r', 6)).to eq('l')
    expect(decryption.decrypt_character('!', 6)).to eq('!')
  end
end
