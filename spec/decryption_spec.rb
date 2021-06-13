require_relative 'spec_helper'
require_relative '../lib/decryption'

describe Decryption do
  it 'exists' do
    decryption = Decryption.new('rwehpfnizzovfzoxvwr', '01234', '110621')

    expect(decryption).to be_a(Decryption)
  end
end
