require 'imdb'

class ImdbStuff
	
	def count_search_results
		#puts "How many results are there for 'Cats' (via IMDB)?"
		Imdb::Search.new("cats").movies.size
	end

	def seasons_info
		{
	    'Breaking Bad' => Imdb::Serie.new("0903747").seasons.size,
	    'Friends' => Imdb::Serie.new("0108778").seasons.size,
	    'Game of Thrones' => Imdb::Serie.new("0944947").seasons.size,
	    'The Office' => Imdb::Serie.new("0386676").seasons.size
	  }
  end

	def sort_the_seasons
	  	result = seasons_info.sort_by {|key, value| value }
	  	sorted_seasons = result.reverse
	  	#[["Friends", 10], ["The Office", 9], ["Game of Thrones", 6], ["Breaking Bad", 5]]
	end

	def most_seasons
		sort_the_seasons[0][0]
	end

	def episodes_info
		{
			'Friends' => Imdb::Serie.new("0108778").season(1).episodes.size,
			'Breaking Bad' => Imdb::Serie.new("0903747").season(1).episodes.size,
			'Game of Thrones' => Imdb::Serie.new("0944947").season(1).episodes.size,
			'The Office' => Imdb::Serie.new("0386676").season(1).episodes.size
		}
	end

	def most_episodes
		result = episodes_info.sort_by {|key, value| value }
		most = result.reverse
		most[0][0]
	end

	def ratings_info
		{
			'Friends' => Imdb::Serie.new("0108778").rating, 
			'Breaking Bad' => Imdb::Serie.new("0903747").rating, 
			'Game of Thrones' => Imdb::Serie.new("0944947").rating, 
			'The Office' => Imdb::Serie.new("0386676").rating
		}
	end

	def best_rated
		ratings = ratings_info.sort_by {|key, value| value }
	  best = ratings.reverse
	  best[0][0]
	end
end
			
imdbstuff = ImdbStuff.new
imdbstuff.count_search_results
imdbstuff.seasons_info
imdbstuff.sort_the_seasons
#puts "Which show has the most seasons? (via IMDB):"
imdbstuff.most_seasons

imdbstuff.episodes_info
#puts "Which series has the most episodes? (via IMDB):"
imdbstuff.most_episodes
imdbstuff.ratings_info
imdbstuff.best_rated


#---------------------------TESTING - TESTING - TESTING - TESTING----------------------------
# describe ImdbStuff do
#   before do
#     @imdbstuff = ImdbStuff.new
#   end

#   describe "#count_search_results" do
#     it "should return the number of 'Cats' results on IMDB" do
#       expect(@imdbstuff.count_search_results).to eq(200)
#     end
#   end

#   describe "#most_seasons" do
#   	it "should return series with the most seasons" do
#   		expect(@imdbstuff.most_seasons).to eq("Friends")
#   	end
#   end

#   describe "#most_episodes" do
#   	it "should return series with the most episodes" do
#   		expect(@imdbstuff.most_episodes).to eq("Friends")
# 		end
# 	end

#   describe "#best_rated" do
#   	it "should return the best rated show" do
#   		expect(@imdbstuff.best_rated).to eq("Game of Thrones")
#   	end
#   end
# end




#----------------- DIRECTIONS - DIRECTIONS - DIRECTIONS -DIRECTIONS -----------------------------




# The fourth method will be a comparator (it might turn into our best friend!). It will take an array of strings, each one being
# the name of a TV show, and it will return the best one using IMDB ratings. For example, if we pass Breaking Bad, Pacific Blue (oh, those
# times!) and The Affair, it will return Breaking Bad (although The Affair is really good, and just won a Golden Globe, even when Golden Globes
# are worthless).

# The fifth and final method will get an integer argument, let's call it X, and will return a hash with the top X movies following IMDB
# rating, including it too. The integer argument should be between 1 and 250, and the returned hash should look like:
# {
#   'Shawsank Redemption' => 9.2,
#   'The Godfather' => 9.2,
#   'The Godfather II' => 9.0,
#   'The Dark Knight' => 8.9,
#   ...and so on until having X movies
# }

# ============================================================
# AND REMEMBER, WE WANT TDD. TESTS FIRST, THEN IMPLEMENTATION.
# ============================================================

# Note: if you grab results from Imdb::Search, it will always return a Imdb::Movie object, not Imdb::Serie. In order to get info an Imdb::Serie,
# which has information like the number of episodes, just use the id to fetch the serie directly:
#   dexter_movie = Imdb::Search.new(‘Dexter’).movies.first
#   dexter_serie = Imdb::Serie.new(dexter_movie.id)

	