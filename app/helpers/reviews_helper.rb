module ReviewsHelper

  def price
    @review.price
  end

  def price_percent
    @review.price * 10
  end

  def portion
    @review.portion
  end

  def taste
    @review.taste
  end

  def average(review)
    if review.price && review.portion && review.taste
      '%.2f' % ((review.price.to_f + review.portion.to_f + review.taste.to_f) / 3)
    end
  end
end
