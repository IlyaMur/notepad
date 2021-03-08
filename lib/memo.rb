class Memo < Post
  def read_from_console
    puts 'Что нужно запомнить? Введите "end" чтобы закончить.'
    input = nil

    until input == 'end'
      input = STDIN.gets.chomp
      @text << input
    end

    @text[0..-2]
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}"

    @text.unshift(time_string)
  end

  def to_db_hash
    super.merge(
      {
        'text' => @text.join('\n\r')
      }
    )
  end

  def load_data(data_hash)
    super(data_hash)

    @text = data_hash['text'].split('\n\r')
  end
end
