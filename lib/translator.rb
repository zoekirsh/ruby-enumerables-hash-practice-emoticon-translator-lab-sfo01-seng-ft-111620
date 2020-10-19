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

def get_english_meaning(path, emoticon)
  load_library(path).each do |key, value|
    if value[:japanese] == emoticon
      return key
    end 
  end 
  return "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(path, emoticon)
  load_library(path).each do |key, value|
    if value[:english] == emoticon
      return value[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

