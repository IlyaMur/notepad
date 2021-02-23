class Post
  def self.print_note_types
    [Task, Memo, Link]
  end

  def self.create_post(index)
    print_note_types[index].new
  end

  def initialize
    @created_at = Time.now
    @text = []
  end

  def read_from_console
  end

  def to_strings
  end

  def save
    File.write(file_path, to_strings.join("\n"), mode: 'w')
  end

  def file_path
    file_name = @created_at.strftime("#{self.class.name}_%Y-%m-%d_%H-%M-%S.txt")

    File.join(__dir__, "\..", "\posts", file_name)
  end
end
