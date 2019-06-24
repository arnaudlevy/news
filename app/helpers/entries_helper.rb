module EntriesHelper
  def clean(text)
    text = text.to_s
    text.gsub!('&nbsp;', ' ')
    text.gsub!('&amp;', '&')
    opening_quotes = '"«‘'
    better_opening_quote = '“'
    closing_quotes = '»˝„'
    better_closing_quote = '”'
    spaces = '       '
    opening_quotes.each_char do |quote|
      spaces.each_char do |space|
        text.gsub!("#{quote}#{space}", better_opening_quote)
      end
      text.gsub!("#{quote}", better_opening_quote)
    end
    closing_quotes.each_char do |quote|
      spaces.each_char do |space|
        text.gsub!("#{space}#{quote}", better_closing_quote)
      end
      text.gsub!("#{quote}", better_closing_quote)
    end
    text
  end
end
