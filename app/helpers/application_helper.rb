module ApplicationHelper
<<<<<<< HEAD
  def time_ago_in_words(time)
    distance_in_minutes = ((Time.current - time) / 60).round

    case distance_in_minutes
    when 0..1
      '1分以内'
    when 2..59
      "#{distance_in_minutes}分前"
    when 60..1439
      "#{(distance_in_minutes / 60).round}時間前"
    when 1440..2879
      '1日前'
    else
      "#{(distance_in_minutes / 1440).round}日前"
    end
  end
end
