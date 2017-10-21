require 'random_data'
15.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
 end
 topics = Topic.all

 50.times do
 	Post.create!(
 	  topic: topics.sample,
 		title:  RandomData.random_sentence,
 		body:   RandomData.random_paragraph
 		)
 end
 10.times do
 	Spost.create!(
 	  topic: topics.sample,
 		title:  RandomData.random_sentence,
 		body:   RandomData.random_paragraph,
    price: RandomData.random_price,
 		)
 end
	posts = Post.all

100.times do
	Comment.create!(
		post: posts.sample,
		body: RandomData.random_paragraph
	)
end

puts "Seed finished"
puts "#{Spost.count} Sposts created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
