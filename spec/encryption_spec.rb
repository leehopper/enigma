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

  it '.encrypt_character' do
    encryption = Encryption.new('Lee Jonathon Hopper', '01234', '110621')

    expect(encryption.encrypt_character('l', 6)).to eq('r')
  end
end
