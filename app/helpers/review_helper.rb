module ReviewHelper
  def average_rating(performer)
    total_rating = 0
    performer.reviews.each do |review|
      total_rating += review.rating
    end
    return total_rating / performer.reviews.length
  end
end
