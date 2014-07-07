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

  def generate_map_json(eatery)
    Gmaps4rails.build_markers(eatery) do |eat, marker|
      marker.lat eat.latitude
      marker.lng eat.longitude
      link = link_to eat.name, eatery_path(eat)
      marker.infowindow "#{link}<br>#{eat.address}<br>#{eat.description.truncate(30)}"
    end
  end

end
