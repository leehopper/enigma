class Crack

  def initialize(text)
    @text = text
  end

  def run_cracking
    text_array = split_text
  end

  def split_text
    @text.split('')
  end

end
