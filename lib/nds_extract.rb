require 'pp'
require 'pry'

# Provided, don't edit
require 'directors_database'

pp directors_database 

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
  
  new_movies = []
  name_index = 0 
  while name_index < movies_collection.length do 
    movies = movies_collection[name_index]
    new_movies << movie_with_director_name(name, movies)
    name_index += 1 
  end
  new_movies
  
end


def gross_per_studio(collection)
  result = {}  
  row_index = 0 
  while row_index < collection.length do
        studio = collection[row_index][:studio]
        gross_income = collection[row_index][:worldwide_gross] 
        
        if result[studio]
          result[studio] += gross_income
        else 
          result[studio] = gross_income
        end
         
  row_index +=1
  end
  return result
end

def movies_with_directors_set(source)
  movies = []
  index = 0 
  
  while index < source.length do 
    director = source[index][:name]
    movie = source[index][:movies]
    movies << movies_with_director_key(director, movie)
    index += 1 
  end
  movies 
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
