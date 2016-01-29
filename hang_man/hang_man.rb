require 'yaml'
class Hang 
	def correct_word_len?(length)
	  (length > 4 && length < 10)
	end

	def get_rand_word words
		# possiblity of infinite loop if word list supplied does not have a word in correct length range
		loop do 
		  rand_word = words[rand(words.length)]
		  return rand_word if correct_word_len? rand_word.length
		end
	end

	def get_user_guess
		puts "Enter your guess"
		loop do 
			guess = gets.chomp.downcase
			return guess if guess =~ /[[:alpha:]]/
			puts "Meant to be a letter"
		end
	end

	def guess_in_word?(guess)
		@secret_word.include? guess
	end

	def print_info
		puts "You have tried #{@tries} times"
		p @correct_letters
		puts "guessed letters #{@guessed_letters}"
	end

	def save_game
		File.open('save.yml','w') {|f| f.puts self.to_yaml}
	end

	def load_game
		YAML.load(File.open('save.yml','r'))
	end

	def check_save_or_load(guess)
		if guess == 'save'
			puts "saving game"
			save_game
			return 'saved'
		elsif guess == 'load'
			puts "loading game"
			@load_state = load_game
		else
			nil 
		end
	end
			
	def load_words
		File.readlines 'words.txt'
	end

	def game_end?
		if !@correct_letters.include? '_'
			puts "You win!!!"
			true
		elsif @tries == 10
			puts "You lose...."
			true
		else
			false
		end
	end

	def update_correct_letters(guess)
		indexes = []
		@secret_word.split('').each_with_index do |letter,index|
			indexes << index if letter == guess 
		end
		indexes.each do |index|
			@correct_letters[index] = guess 
		end
	end


	def play_game
		while @tries < 11 
			print_info
			user_guess = get_user_guess 
			state = check_save_or_load(user_guess)
			return state if state 
			@guessed_letters << user_guess
			update_correct_letters(user_guess)
			break if game_end? 
			@tries += 1
		end
	end

	def initialize
		@secret_word = (get_rand_word load_words).chomp
		@guessed_letters = []
		# puts @secret_word.length
		@correct_letters = ['_']*@secret_word.length
		# p @secret_word
		@load_state = nil 
		@tries = 0 
		play_game
		@load_state.play_game if @load_state
	end

end
Hang.new