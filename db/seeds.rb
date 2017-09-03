require 'random_data'

50.times do
	Post.create!(
		title:  RandomData.random_sentence,
		body:   RandomData.random_paragraph
		)
end
puts "Now have #{Post.count} posts."

posts = Post.all

100.times do
	Comment.create!(
		post: posts.sample,
		body: RandomData.random_paragraph
	)
end
puts "Now have #{Comment.count} comments."

10.times do
	Advertisement.create!(
		title:  RandomData.random_sentence,
		copy:   RandomData.random_paragraph,
		price:  rand(100)
	)
end
puts "Now have #{Advertisement.count} advertisements."

puts "Seed finished"
