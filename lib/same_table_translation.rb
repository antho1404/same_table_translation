require "same_table_translation/version"

module SameTableTranslation
  def translatable(*attributes)
    locales = I18n.available_locales
    attributes.each do |attribute|
      locales.each do |locale|
        begin
          name = "#{attribute.to_s}_#{locale.to_s}"
          attr_accessible name.to_sym if self.attribute_names.include?(name)
        rescue
        end
      end
    end

    attributes.each do |attribute|
      define_method attribute.to_s do
        begin
          self.attributes["#{attribute.to_s}_#{I18n.locale.to_s}"]
        rescue
        end
      end

      define_method "#{attribute.to_s}=" do |value|
        begin
          self.attributes = { "#{attribute}_#{I18n.locale.to_s}" => value }
        rescue
        end
      end
    end

    scope :translated, lambda { |attribute|
      where(arel_table["#{attribute.to_s}_#{I18n.locale.to_s}".to_sym].not_eq(nil))
    }

    scope :untranslated, lambda { |attribute|
      where(arel_table["#{attribute.to_s}_#{I18n.locale.to_s}".to_sym].eq(nil))
    }
  end
end

ActiveRecord::Base.extend SameTableTranslation
