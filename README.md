# SameTableTranslation

This gem is usefull when you whant to translate attributes from active record model in rails.
Most of translations gems use a different table in order to save a lot of translations but if you know exactly which locales you want (for exemple en and fr) it is very time consuming to store it in another table so this gem will store values on the same table and will replace the attribute column by many columns suffixed by the locale.

## Installation

Add this line to your application's Gemfile:

    gem 'same_table_translation'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install same_table_translation

## Usage

First you need to generate migrations for your model

    $ rails g same_table_translation:translate [Model] [attributes]

This will create a migration with new column for each attributes on each locale you have available in your project and remove (and migrate data) the attribute if exsists.

Then you have to add the instructions on your model to have access to some functionnalities
    
    class MyModel < ActiveRecord::Base
      translatable my_attributes
    end


Now you can have access to your attribute directly and this will assign or get the value for the current locale

exemple with current locale set as en:

    comment = Comment.new
    comment.message = "This is a message"   # this will update message_en attribute
    I18n.locale = :fr                       # set the locale to french
    puts comment.message                    # nil because it will return message_fr
    comment.message = "Ceci est un message" # update value for message_fr attribute
    I18n.locale = :en
    puts comment.message                    # This is a message


You also have some scope to simplify things like translated(attribute) or untranslated(attribute) to list all value with attribute translated or untranslated

    Comment.translated(:message)     # will return all comments with message translated in the locale used
    Comment.untranslated(:message)   # will return all comments with message not translated in the locale used

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
