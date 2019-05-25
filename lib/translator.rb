# require modules here
require "yaml"
require 'pry'

def load_library(file)
  load = YAML.load_file(file)
  emo = {}
  emo["get_meaning"] = {}
  emo["get_emoticon"] = {}
  load.each do |emotion, emotes|
    emo["get_emoticon"][emotes[0]] = emotes[1]
    emo["get_meaning"][emotes[1]] = emotion
  end
  emo
end

def get_japanese_emoticon(file, emoticon)
  emo = load_library(file)
  if emo["get_emoticon"][emoticon]
    emo["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  emo = load_library(file)
  if emo["get_meaning"][emoticon]
    emo["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
