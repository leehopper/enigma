class Key
  attr_reader :key

  def initialize(key)
    @key = generate_key(key)
  end

  def generate_key(key)
    if key == 'none'
      5.times.map do
        rand(10)
      end.join
    else
      key
    end
  end

  def create_shift_key
    output = []
    4.times do |acc|
      output << @key[acc] + @key[acc + 1]
    end
    convert_to_integers(output)
  end

  def convert_to_integers(shift_key)
    shift_key.map do |key|
      key.to_i
    end
  end

  def convert_key_shift(key_shift)
    index1 = key_shift[0].to_s
    index2 = key_shift[1].to_s
    index3 = key_shift[2].to_s
    index4 = key_shift[3].to_s
    loop do
      test1 = find_num(index1, index2)
      if test1 == "restart"
        reset = true
      else
        index2 = test1
      end
      unless reset == true
        test2 = find_num(index2, index3)
        if test2 == "restart"
          reset = true
        else
          index3 = test2
        end
      end
      unless reset == true
        test3 = find_num(index3, index4)
        if test3 == "restart"
          reset = true
        else
          index4 = test3
          break
        end
      end
      if index1.to_i <= 9
        index1 = '0' + index1
      elsif index1.to_i < 73
        index1 = add_27(index1)
      end
      index2 = key_shift[1].to_s
      index3 = key_shift[2].to_s
      index4 = key_shift[3].to_s
      reset = false
    end
    @key = index1 + index2[1] + index3[1] + index4[1]
  end

  def find_num(test1, test2)
    num1 = test1
    num2 = test2
    restart = nil
    if num2.to_i <= 9
      num2 = '0' + num2
    end
    until num1[1] == num2[0]
      num2 = add_27(num2)
      if num2.to_i > 99
        restart = true
        break
      end
    end
    if restart == true
      "restart"
    else
      num2
    end
  end

  def add_27(num)
    output = num.to_i
    output += 27
    output.to_s
  end
end
