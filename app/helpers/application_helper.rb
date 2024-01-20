module ApplicationHelper
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