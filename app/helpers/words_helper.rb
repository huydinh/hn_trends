module WordsHelper
  def from_date_options
    [ ['yesterday', 1],
      ['last week', 7],
      ['2 last week', 14],
      ['last month', 28] ]
  end

  def width_for_point(point)
    point = point.to_i

    point = point > 10 ? 10 : point
    point = point <= 0 ? 1 : point

    "item-#{point}"
  end

  def hn_link(href)
    if href.match(/^item\?id=\d+/)
      "https://news.ycombinator.com/#{href}"
    else
      href
    end
  end
end
