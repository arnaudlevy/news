module EntriesHelper
  def clean_quotes(text)
    opening_quotes = '"«‘'
    better_opening_quote = '“'
    closing_quotes = '»˝„'
    better_closing_quote = '”'
    spaces = '     '
    opening_quotes.each do |quote|
      text.gsub!("#{quote}", better_opening_quote)
      spaces.each do |space|
        text.gsub!("#{quote}#{space}", better_opening_quote)
      end
    end
    closing_quotes.each do |quote|
      text.gsub!("#{quote}", better_closing_quote)
      spaces.each do |space|
        text.gsub!("#{space}#{quote}", better_closing_quote)
      end
    end
    text
  end

  def clean_ampersands(text)
    text.gsub!('&amp;', '&')
    text
  end
end
