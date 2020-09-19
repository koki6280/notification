require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bookers2Debug
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.i18n.default_locale = :ja

    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
    	if instance.kind_of?(ActionView::Helpers::Tags::Label)
    		html_tag.html_safe
    	else
    		class_name = instance.object.class.name.underscore
    		method_name = instance.instance_variable_get(:@method_name)
    		"<div class=\"has-error\">#{html_tag}
    		   <span class=\"help-block\">
    		      #{I18n.t("activerecord.attributes.#{class_name}.#{method_name}")}
                  #{instance.error_message.first}
               </span>
            </div>".html_safe
        end
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
