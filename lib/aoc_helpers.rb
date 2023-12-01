# frozen_string_literal: true

def load_input(filename: "input.txt")
  calling_file = caller_locations(1, 1).first.absolute_path
  dir_path = File.dirname(calling_file)
  filepath = File.join(dir_path, filename)
  File.read(filepath)
end
