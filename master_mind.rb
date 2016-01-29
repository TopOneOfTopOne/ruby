class Master_mind
  @@yes_answers = %w(yes y ok fine fuck maybe positive)
  @@no_answers = %w(no n negative never)
  def initialize
    print_welcome
    if user_codebreaker?
      @secret_code = get_code_computer
      puts game_user_outcome
    else
      @secret_code = get_code_user
      puts game_computer_outcome
    end
  end

  def game_user_outcome
    12.times do |tries|
      puts "You have tried #{tries} time(s) leaving you with #{12-tries} left"
      result = guess_result( get_code_user )
      p result
      return 'User won' if correct_guess? result
    end
    'User lost'
  end

  def game_computer_outcome
    12.times do
      guess = get_code_computer
      p "Trying #{guess}..."
      return 'Computer wins!' if correct_guess?(guess_result(guess))
    end
    'Computer lost!'
  end

  def correct_guess?(guess_result)
    guess_result == %w(C C C C)
  end

  def guess_result(guess)
    result = []
    remaining_code = []
    @secret_code.each {|num| remaining_code << num}
    guess.each_with_index do |guess_num,guess_index|
      if is_c?(guess_num, guess_index,remaining_code)
        remaining_code.delete_at((remaining_code.index guess_num))
        result << 'C'
      elsif is_w? guess_num, remaining_code
        remaining_code.delete_at((remaining_code.index guess_num))
        result << 'W'
      else
        result << 'N'
      end
    end
    result
  end

  def is_c?(num, index, remaining_code)
    (@secret_code[index] == num && remaining_code.include?(num)) ? true : false
  end

  def is_w?(num, remaining_code)
    remaining_code.include? num
  end


  def print_welcome
    puts "Rules: \n1. code consists of 4 numbers 1-6 inclusive \
         \n2. Codebreaker has 12 tries to guess the code \
         \n3. An array consisting of 4 characters will be returned after each guess: \n'C' correct number and placement, 'W' correct number, wrong placement, 'N' incorrect number"
  end

  def user_codebreaker?
    puts 'Do you want to be codebreaker?'
    loop do ans = gets.chomp.downcase
      if @@yes_answers.include? ans
        return true
      elsif
        @@no_answers.include? ans
        return false
      else
        puts 'Sorry I dun understand'
      end
    end
  end

  def get_code_user
    puts 'Remember code has to be 4 numbers, 1-6 inclusive'
    puts 'Enter your code: '
    loop do ans = gets.chomp
      if correct_code_format? ans
        return code_str_to_i(ans)
      end
      puts 'Sorry incorrect format, try again:'
    end
  end

  def get_code_computer
    guess = []
    4.times do
      guess << rand(1..6)
    end
    guess
  end

  def correct_code_format?(code)
    code = code.split('')
    if (code.length == 4) && (code.all? {|num| num.to_i > 0 && num.to_i < 7})
      return true
    end
    false
  end

  def code_str_to_i(code)
    code_in_i = []
    code.split('').each {|num| code_in_i << num.to_i}
    code_in_i
  end
end

# Master_mind.new