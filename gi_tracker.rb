require 'yaml'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'

configure do
  enable :sessions
  set :session_secret, 'gut_buster_secret_id'
  disable :protection
end

class User
  def initialize(first_name, last_name, email, age, height, weight)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @age = age
    @height = height
    @weight = weight
  end

  def add_food; end

  def add_gi_symptom; end

end

class MealDay
  
end

class Meal
  def initialize(foods, prep_type, meal_category, time)
    @foods = foods
    @prep_type = prep_type
    @meal_category = meal_category
    @time = time
  end
end

########## ROUTES ##########

get '/' do

  if session[:user]
    session[:logged_in] = true
    @session = session
    erb :index
  else 
    erb :login
  end
end