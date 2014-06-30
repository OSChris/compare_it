module EateriesHelper
  def eatery_score(eatery)
    if eatery.reviews.count > 0
      total = 0
      eatery.reviews.each do |review|
        total += average(review).to_f
      end
      score = total / eatery.reviews.count
      '%.2f' % score.to_f
    end
  end

end
