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


def get_japanese_emoticon(hash, string)
  # look up inner value and return other inner value 
  
end

def get_english_meaning(hash, string)
  # look up the inner value and return the outer key 
end