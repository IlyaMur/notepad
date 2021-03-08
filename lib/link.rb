class Link < Post
  def initialize
    super
    @url = ''
  end

  def read_from_console
    puts 'Введите текст ссылки:'
    @url = gets.chomp

    puts 'Введите адрес ссылки:'
    @text = gets.chomp
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n"

    [@url, @text, time_string]
  end

  def to_db_hash
    super.merge(
      {
        'url' => @url,
        'text' => @text
      }
    )
  end

  def load_data(data_hash)
    super(data_hash)

    @url = data_hash['url']
  end
end
