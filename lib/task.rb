require 'date'

class Task < Post
  def initialize
    super

    @due_date = Time.now
  end

  def read_from_console
    puts 'Что нужно сделать?'
    @text = gets.chomp

    puts 'К каком числу нужно сделать?(ДД.ММ.ГГГГ)'
    input = gets.chomp

    @due_date = Date.parse(input)
  end

  def to_strings
    deadline = "Крайний срок: #{@due_date.strftime('%Y.%m.%d')}"
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')} \n"

    [@text, deadline, time_string]
  end
end
