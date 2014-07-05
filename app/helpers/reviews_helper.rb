module ReviewsHelper

  def price(object_with_price)
    object_with_price.price
  end

  def price_percent(object_with_price)
    object_with_price.price * 10
  end

  def portion(object_with_portion)
    object_with_portion.portion
  end

  def portion_percent(object_with_portion)
    object_with_portion.portion * 10
  end

  def taste(object_with_taste)
    object_with_taste.taste
  end

  def taste_percent(object_with_taste)
    object_with_taste.taste * 10
  end

  def average(review)
    if review.price && review.portion && review.taste
      '%.2f' % ((review.price.to_f + review.portion.to_f + review.taste.to_f) / 3)
    end
  end

  def average_bar(review)
    if review.price && review.portion && review.taste
      val = '%.2f' % ((review.price.to_f + review.portion.to_f + review.taste.to_f) / 3)
      val.to_i * 10
    end
  end

  def number_of_likes(review)
    review.votes_for.size
  end

end
