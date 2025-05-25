class Country < ApplicationRecord
end

  def score_color_class
    case score_letter_rating
    when "A" then "score-a"
    when "B" then "score-b"
    when "C" then "score-c"
    when "D" then "score-d"
    when "E" then "score-e"
    when "F" then "score-f"
    when "G" then "score-g"
    else "bg-gray-400 text-white"
    end
  end

  def score_hex_color
    case score_letter_rating
    when "A" then "#15803d"
    when "B" then "#16a34a"
    when "C" then "#4ade80"
    when "D" then "#fcd34d"
    when "E" then "#f59e0b"
    when "F" then "#f97316"
    when "G" then "#ef4444"
    else "#9ca3af"
    end
  end
