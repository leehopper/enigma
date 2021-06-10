require_relative '../lib/key'
require 'rspec'

describe Key do
  before (:each) do
    @key = Key.new(01234)
  end

  it 'exists' do
    expect(@key).to be_a(Key)
  end
end
