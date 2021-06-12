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
end
