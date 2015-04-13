module NgTemplate
  class Engine < ::Rails::Engine
    isolate_namespace NgTemplate

    initializer 'ng_template init' do
      config.ng_template = ActiveSupport::OrderedOptions.new
      config.ng_template.mode = :html
      config.ng_template.prefix = '_'
    end
  end
end
