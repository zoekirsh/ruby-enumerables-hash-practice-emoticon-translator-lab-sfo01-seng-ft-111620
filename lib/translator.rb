require 'pry'
require "yaml"


def load_library(path)
  emoji_library = {}
  YAML.load_file(path).each do |key, value|
    emoji_library[key] = {}
    emoji_library[key][:english] = value[0]
    emoji_library[key][:japanese] = value[1]
  end
  emoji_library
end


def get_japanese_emoticon(path, string)
  # look up inner value and return other inner value 
  load_library(path)
  
end

def get_english_meaning(path, string)
  # look up the inner value and return the outer key 
end