# Emoticon Translator

## Learning Goals

- Convert data from a file into usable Ruby data structure
- Traverse Hash data to find specific values

## Background

Your friend JJ just moved to Japan and loves it. However, sometimes he gets
confused because his new friends text him emoticons that he doesn't recognize,
like `＼(◎o◎)／!` and `((d[-_-]b))`.

He asks you to create a method that will translate these emoticons to their
English names. He also asks you to create a method that will convert his English
emoticons, like `:)`, into their Japanese equivalents so that he can look cool
in texts to his new friends.

We have an emoticon dictionary of sorts, `lib/emoticons.yml`, but it a _YAML_
file, something we haven't seen before. As humans, we can read this file, but
the contents are not in a format that we're used to working within Ruby.

Before we can build out our friend's methods, we will need to create a helper
method that reads `lib/emoticons.yml` and organizes the data it contains into a
nested data structure. With a nested data structure, we can use Enumerables to
help translate emoticons.

## Instructions

1. Write a method, `load_library`, that loads the `emoticons.yml` file. This
   method should return a hash where each key is the name of an emoticon. Each
   emoticon name should point to a _nested_ hash containing two keys,
   `:english` and `:japanese`. These keys will point to English and Japanese
   versions of the emoticon. If `lib/emoticons.yml` had just one translation:

   ```text
   happy:
     - ":)"
     - "(＾ｖ＾)"
   ```

   `load_library` would be expected to return the following data structure:

   ```rb
   {
      'happy' => {
         :english => ":)",
         :japanese => "(＾ｖ＾)"
      }
   }
   ```

   For reference, here is the full list of emoticons stored in `lib/emoticons.yml`

   | Meaning    | English |   Japanese    |
   | ---------- | :-----: | :-----------: |
   | angel      |   O:)   |    ☜(⌒▽⌒)☞    |
   | angry      |   >:(   | ヽ(ｏ`皿′ｏ)ﾉ |
   | bored      |   :O    |    (ΘεΘ;)     |
   | confused   |   %)    |    (゜.゜)    |
   | embarrassed |   :$    |    (#^.^#)    |
   | fish       |   ><>   |   >゜))))彡   |
   | glasses    |   8D    |    (^0_0^)    |
   | grinning    |   =D    |  （￣ー￣）   |
   | happy      |   :)    |  （＾ｖ＾）   |
   | kiss       |   :\*   |  (\*^3^)/~☆   |
   | sad        |   :'(   |    (Ｔ▽Ｔ)    |
   | surprised  |   :o    |      o_O      |
   | wink       |   ;)    |    (^\_-)     |

2. Write a method, `get_english_meaning`, that takes a Japanese emoticon and
   returns its name in English. This method will rely on `load_library` to
   first load the YAML file.

   Example usage:

   ```rb
   get_english_meaning("./lib/emoticons.yml", "(Ｔ▽Ｔ)")
    # => "sad"
   get_english_meaning("./lib/emoticons.yml", "☜(⌒▽⌒)☞")
    # => "angel"
   ```

3. Write a method, `get_japanese_emoticon`, that will take a traditional Western
   emoticon (i.g. `:)`) and translate it to its Japanese version (`(＾ｖ＾)`). It will also rely
   `load_library` to first load the YAML file.

   Example usage:

   ```rb
   get_japanese_emoticon("./lib/emoticons.yml", ":)")
    # => "(＾ｖ＾)"
   get_japanese_emoticon("./lib/emoticons.yml", ":o")
    # => "o_O"
   ```

## What is YAML?

### About

YAML is a recursive acronym for "YAML Ain't Markup Language". YAML is used
because it is easier for humans to read and write than typing out entire arrays,
hashes, etc.

### Example 1

For instance, take this fruit YAML file:

```yml
# fruits.yml
- Apple
- Orange
- Strawberry
- Mango
```

When Ruby loads the YAML file above, the list of fruits would become an
array:

```ruby
require "yaml"
fruits = YAML.load_file('fruits.yml')

fruits
# => ["Apple","Orange","Strawberry","Mango"]
```

### Example 2

Another example could be a hash:

```yml
# government.yml
president: Barack Obama
vice president: Joe Biden
secretary of state: John Kerry
secretary of the treasury: Jacob Lew
```

When Ruby loads the YAML file above, the list of position titles and names
would become a hash of keys and values:

```ruby
require "yaml"
gov = YAML.load_file('government.yml')

gov
# =>
# {
#   "president" => "Barack Obama",
#   "vice president" => "Joe Biden",
#   "secretary of state" => "John Kerry",
#   "secretary of the treasury" => "Jacob Lew"
# }
```

This is the case in `lib/emoticons.yml`. If you convert the file, Ruby will
produce a structure like this:

```rb
{
   "angel" => [ "O:)", "☜(⌒▽⌒)☞" ],
   "angry" => [ ">:(", "ヽ(ｏ`皿′ｏ)ﾉ" ],
   "bored" => [ ":O", "(ΘεΘ;)" ],
   "confused" => [ "%)", "(゜.゜)" ],
   "embarrassed" => [ ":$", "(#^.^#)" ],
   "fish" => [ "><>", ">゜))))彡" ],
   "glasses" => [ "8D", "(^0_0^)" ],
   "grinning" => [ "=D", "(￣ー￣)" ],
   "happy" => [ ":)", "(＾ｖ＾)" ],
   "kiss" => [ ":*", "(*^3^)/~☆" ],
   "sad" => [ ":'(", "(Ｔ▽Ｔ)" ],
   "surprised" => [ ":o", "o_O" ],
   "wink" => [ ";)", "(^_-)" ]
}
```

This is _close_ to what we want from the `load_library` method, but work will
still need to be done to organize the emoticons into hashes with `:english` and
`:japanese` key/value pairs.

### Final Words about YAML

A YAML file has an extension of `.yml`. For more info about YAML syntax, see
[Ansible's docs][ansible]. You can read more about YAML
[on the Wikipedia page][wiki].

## Notes on this Lab

This is a test-driven lab so just get those specs to pass! The first step will
be to load the YAML file in the `lib/` folder. Check out the resources below for
help loading a YAML file.

**Important**: When defining hash keys, depending on the syntax that you use,
Ruby may automatically convert a given String key into a Symbol. So, for
instance, if we were to open IRB and declare a hash using the hash-rocket, the
resulting key remains a String:

```ruby
hash = {"angel" => {}}
hash #=> {"angel"=>{}}
```

However, if the alternate syntax is used, the key will be converted:

```ruby
hash = {"angel": {}}
hash #=> {:angel=>{}}
```

Keep this in mind as you work on this lab. The tests will accept either, but you
will need to be consistent in your own code when referencing hash keys. YAML
will not convert the emoticons to symbols when reading `emoticons.yml`.

## Resources

- [Wikipedia][wiki]
- [YAML][yaml]
- [Stack Overflow](http://stackoverflow.com/) - [Loading a YAML File](http://stackoverflow.com/a/3877355)
- [List of Emoticons][emoticons]

[wiki]: http://en.wikipedia.org/wiki/YAML
[yaml]: https://ruby-doc.org/stdlib-2.5.0/libdoc/yaml/rdoc/YAML.html
[emoticons]: http://en.wikipedia.org/wiki/List_of_emoticons
[ansible]: http://docs.ansible.com/YAMLSyntax.html

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/emoticon-translator' title='Emoticon Translator'>Emoticon Translator</a> on Learn.co and start learning to code for free.</p>
