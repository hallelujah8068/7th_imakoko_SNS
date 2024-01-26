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
=======
    def time_ago_in_japanese_words(time)
      seconds_ago = (Time.current - time).to_i
      minutes_ago = seconds_ago / 60
      hours_ago = minutes_ago / 60
      days_ago = hours_ago / 24
      months_ago = days_ago / 30
      years_ago = days_ago / 365
  
      case
      when years_ago >= 1
        "#{years_ago.to_i}年前"
      when months_ago >= 1
        "#{months_ago.to_i}ヶ月前"
      when days_ago >= 1
        "#{days_ago.to_i}日前"
      when hours_ago >= 1
        "#{hours_ago.to_i}時間前"
      when minutes_ago >= 1
        "#{minutes_ago.to_i}分前"
      else
        "#{seconds_ago}秒前"
      end
    end
  end
>>>>>>> 7949f11 (add:post機能)
