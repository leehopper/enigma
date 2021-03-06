require_relative '../lib/enigma'
require_relative 'spec_helper'

describe Enigma do
  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_a(Enigma)
  end

  it '.encrypt' do
    enigma = Enigma.new
    expected = enigma.encrypt("hello world", "02715", "040895")

    expect(expected).to eq({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      })
  end

  it '.decrypt' do
    enigma = Enigma.new
    expected = enigma.decrypt("keder ohulw", "02715", "040895")

    expect(expected).to eq({
      decryption: "hello world",
      key: "02715",
      date: "040895"
      })
  end
end
