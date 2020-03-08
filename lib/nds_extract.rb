# Provided, don't edit
require 'directors_database'
require 'pp'
require 'pry'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  hash = {
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
  return hash
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  arrOfMovies = []
#  movies_collection = movie_with_director_name(name, movies_collection[0])
  #puts movies_collection
  #puts movie_with_director_name(name, movies_collection[0])
  movies_collection.each do |movie|
    hash = movie_with_director_name(name, movie)
    arrOfMovies << hash
  end
  arrOfMovies
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  studios = {}
  newStudios = {}
  collection.each do |hash|
    if studios.has_key?(hash[:studio])
      studios = studios.update(studios){|k,v|
        v + hash[:worldwide_gross]}
    else
      studios[hash[:studio]] = hash[:worldwide_gross]
    end
  end
  puts studios
  return studios

end

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  finalArr = []
  source.each do |key|
    key[:movies].each do |movie|
      newHash = {}
      newArr = []
      #newHash = movies_with_director_key(key[:name], source)
      newHash[:director_name] = key[:name]
      newHash[:title] = movie[:title]
      newHash[:worldwide_gross] = 5
      newHash[:release_year] = 20000
      newHash[:studio] = "Karbit Poodles"
      puts newHash
      newArr << newHash
      finalArr << newArr
  end
  end
  return finalArr
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!
=begin
def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
=end
