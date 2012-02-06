class Movie < ActiveRecord::Base

  def self.getAllRatings
    allMovies=self.all
    allRatings=[]
    
    allMovies.each do |movie|
      rating=movie.rating
      print 'this is movies rating ' + rating 
      p "\n"
      if allRatings.include?(rating)
        next
      else
        allRatings.push(rating)
      end  
    end
    
    return allRatings
    
  end
  
end
