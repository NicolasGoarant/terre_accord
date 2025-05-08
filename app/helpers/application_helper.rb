module ApplicationHelper
  def score_color(score)
    case score
    when 'A'
      '#15803d' # vert foncé
    when 'B'
      '#16a34a' # vert
    when 'C'
      '#4ade80' # vert clair
    when 'D'
      '#fcd34d' # jaune
    when 'E'
      '#f59e0b' # orange
    when 'F'
      '#f97316' # orange foncé
    when 'G'
      '#ef4444' # rouge
    else
      '#9ca3af' # gris
    end
  end
  
  def truncate_text(text, length = 100)
    if text && text.length > length
      text[0...length] + '...'
    else
      text
    end
  end
end
