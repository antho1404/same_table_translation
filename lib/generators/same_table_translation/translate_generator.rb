require 'rails/generators'
require 'rails/generators/active_record'

module SameTableTranslation
  
  class TranslateGenerator < Rails::Generators::NamedBase
    include Rails::Generators::Migration

    argument :attachment_names, required: true, type: :array, desc: "The names of the attributes to translate."

    def self.source_root
      @source_root ||= File.expand_path('../templates', __FILE__)
    end

    def self.next_migration_number(path)
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    end
    
    def copy_migration
      migration_template "translate_migration.rb.erb", "db/migrate/#{migration_name}.rb"
    end

    protected

    def migration_name
      "translate_#{attachment_names.join("_")}_to_#{name.underscore.pluralize}"
    end

    def migration_class_name
      migration_name.camelize
    end
  end
end
