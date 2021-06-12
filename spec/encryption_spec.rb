require_relative 'spec_helper'
require_relative '../lib/encryption'

describe Encryption do
  it 'exists' do
    encryption = Encryption.new('Lee Jonathon Hopper', '01234', '110621')

    expect(encryption).to be_a(Encryption)
  end

  it 'create_shift' do
    encryption = Encryption.new('Lee Jonathon Hopper', '01234', '110621')

    expect(encryption.create_shift).to eq([6, 18, 27, 35])
  end

  it '.reduce_shift' do
    encryption = Encryption.new('Lee Jonathon Hopper', '01234', '110621')
    expected = encryption.reduce_shift([6, 18, 27, 35])

    expect(expected).to eq([6, 18, 0, 8])
  end

  it '.split_and_downcase_text' do
    encryption = Encryption.new('Lee H', '01234', '110621')

    expect(encryption.split_and_downcase_text).to eq(['l', 'e', 'e', ' ', 'h'])
  end

  it '.encrypt_character' do
    encryption = Encryption.new('Lee Jonathon Hopper', '01234', '110621')

    expect(encryption.encrypt_character('l', 6)).to eq('r')
    expect(encryption.encrypt_character('!', 6)).to eq('!')
  end

  it '.encrypt_text' do
    encryption = Encryption.new('Lee H', '01234', '110621')
    expected = encryption.encrypt_text([6, 18, 0, 8], ['l', 'e', 'e', ' ', 'h'])

    expect(expected).to eq(['r', 'w', 'e', 'h', 'n'])
  end

  it '.format_text' do
    encryption = Encryption.new('Lee H', '01234', '110621')
    expected = encryption.format_text(['r', 'w', 'e', 'h', 'n'])

    expect(expected).to eq('rwehn')
  end

  it '.create_output_hash' do
    encryption = Encryption.new('Lee H', '01234', '110621')
    expected = encryption.create_output_hash('rwehn')
    expect(expected).to eq({
      encryption: 'rwehn',
      key: '01234',
      date: '110621'
      })
  end

  it '.run_encryption' do
    encryption = Encryption.new('Lee Jonathon Hopper', '01234', '110621')


    expect(encryption.run_encryption).to eq({
      encryption: 'rwehpfnizzovfzoxvwr',
      key: '01234',
      date: '110621'
      })
  end
end
