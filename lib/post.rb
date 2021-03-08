require 'sqlite3'

class Post

  @@SQLITE_DB_FILE = "data/notepad.sqlite"

  def self.post_types
    {
      'Memo' => Memo,
      'Task' => Task,
      'Link' => Link
    }
  end

  def self.create(type)
    post_types[type].new
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

  def save_to_db
    db = SQLite3::Database.open(@@SQLITE_DB_FILE)

    db.results_as_hash = true

    db.execute("INSERT INTO posts (" +
      to_db_hash.keys.join(',') +
      ")" +
      " VALUES (" +
      ("?," * to_db_hash.keys.size).chomp(',') +
      ")",
      to_db_hash.values
    )

    db.last_insert_row_id
  end

  def to_db_hash
    {
      'type' => self.class.name,
      'created_at' => @created_at.to_s
    }
  end
end
