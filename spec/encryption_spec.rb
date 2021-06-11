require_relative 'spec_helper'
require_relative '../lib/encryption'

describe Encryption do
  it 'exists' do
    encryption = Encryption.new('Lee Jonathon Hopper', '01234', '061121')

    expect(encryption).to be_a(Encryption)
  end
end
