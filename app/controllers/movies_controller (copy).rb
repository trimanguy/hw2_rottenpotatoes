class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    
    @sortTitle = false
    @sortDate = false
    @all_ratings = Movie.getAllRatings
    print 'this is @all_ratings'
    print @all_ratings 
    paramTitle = params["sortTitle"]
    paramDate = params["sortDate"]
    p "params is" 
    p params  
    ratingsHash = params["ratings"]
    allowedRatings = ratingsHash.keys
    
    #find(:all, :conditions => [ "rating" = ? , user_name, password ])
    #Company.find(:first, :conditions => ["id = :id AND name = :name AND division = :division AND created_at > :accounting_date", { :id => 3, :name => "37signals", :division => "First", :accounting_date => '2005-01-01' }])
    
    #Movie.find(:all, :conditions => { 'rating' => allowedRatings })
    
    
    
    if (paramTitle == nil) && (paramDate == nil)
      @movies = Movie.all
    elsif paramTitle == "true"
      @movies = Movie.find(:all, :order => 'title')
      @sortTitle = true
    elsif paramDate == "true"
      @movies = Movie.find(:all, :order => 'release_date')
      @sortDate = true
    else
      @movies = Movie.all
    end
    
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
