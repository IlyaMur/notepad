require_relative 'lib/post'
require_relative 'lib/task'
require_relative 'lib/link'
require_relative 'lib/memo'


post_types = Post.print_note_types

input = -1

until input.between?(1, post_types.size)
  post_types.each.with_index(1) do |post, i|
    puts "#{i}. #{post}"
  end
  input = gets.to_i
end

post = Post.create_post(input - 1)

post.read_from_console
post.save
