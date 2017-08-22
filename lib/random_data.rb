# here we are defining RandomData as a module because it is a
# standalone library we can't make copies or inherit.
# On the other hand models are classes.
module RandomData
# Here we define random paragraph
	def self.random_paragraph
# We set sentences to an array
		sentences = []
# We create 4 to 6 random sentences and append them to "sentences"
		rand(4..6).times do
			sentences << random_sentence
		end
# We call join on sentences  to combine but add a space.
		sentences.join(" ")
	end

	def self.random_sentence
		strings = []
		rand(3..8).times do
		strings << random_word
		end
		sentence = strings.join(" ")
		sentence.capitalize << "."
	end

	def self.random_word
	# We set letters from a-z we use .to_a to turn 
	# them into an array.
		letters = ('a'..'z').to_a
		letters.shuffle!
		letters[0,rand(3..8)].join
	end
end

# The point of a module is to keep random data
