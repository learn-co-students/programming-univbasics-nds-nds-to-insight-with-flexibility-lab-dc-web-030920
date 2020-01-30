# Provided, don't edit
require 'directors_database'
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
  {
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }

end


# Your code after this point

def movies_with_director_key(name, movies_collection)
 answer_movie = []
 i = 0

while i< movies_collection.length do
  movie_data = movies_collection[i]
  answer_movie << movie_with_director_name(name, movie_data)

  i +=1

   end

answer_movie
end
# [{:title=>"TestA",
#   :worldwide_gross=>nil,
#   :release_year=>nil,
#   :studio=>nil,
#   :director_name=>"Byron Poodle"},
#  {:title=>"TestB",
#   :worldwide_gross=>nil,
#   :release_year=>nil,
#   :studio=>nil,
#   :director_name=>"Byron Poodle"}]

# movies = movies_with_director_name(name,movies_collection)
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



def gross_per_studio(collection)
  # [{:title=>"Movie A", :studio=>"Alpha Films", :worldwide_gross=>10},
  #  {:title=>"Movie B", :studio=>"Alpha Films", :worldwide_gross=>30},
  #  {:title=>"Movie C", :studio=>"Omega Films", :worldwide_gross=>30}]

  result = {}
  i = 0
  while i < collection.length
    movies = collection[i]
    if !result[movies[:studio]]
      result[movies[:studio]] = movies[:worldwide_gross]
    else
      result[movies[:studio]] += movies[:worldwide_gross]
    end
    i +=1
  end
  result
end

  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #{"Alpha Films"=>40, "Omega Films"=>30}
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash


def movies_with_directors_set(source)
  i = 0
  answer = []

  while i<source.length do

   
    dir_info_hash = source[i]
    director_name = dir_info_hash[:name]
    director_movies =  dir_info_hash[:movies]
    answer << movies_with_director_key(director_name,director_movies)
    i += 1
end

   answer
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
