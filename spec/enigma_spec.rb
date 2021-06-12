require_relative '../lib/enigma'

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
end
