module NgTemplate
#
# Helper to render angularjs templates as partials
#
# USAGE
# class ApplicationController
#   helper NgTemplate::TemplateHelper
#   ...
# end
module TemplateHelper
  class TemplateRenderer
    def initialize(view_ctx, paths, opt = {})
      @view_ctx = view_ctx
      @paths = Array(paths)
      @opt = {
        mode: Rails.configuration.ng_template.mode,
        prefix: Rails.configuration.ng_template.prefix,
      }.merge!(opt)
    end

    #
    # @return html-safe-template
    #
    def render
      templates = @view_ctx.view_paths.map do |view_path|
        @paths.map do |path|
          render_path(view_path, path)
        end
      end

      templates.flatten.compact.map do |template|
        render_html(template)
      end.join("\n").html_safe
    end

    private

    def render_html(template)
      "<script type='text/ng-template' id='#{template[:name]}'>\n#{template[:content]}\n</script>"
    end

    #
    # @return [{name: template-name, content: template}, ...]
    #
    def render_path(view_path, path)
      Dir["#{view_path}/#{path}/#{@opt[:prefix]}*.html*"].map do |file_path|
        name = File.basename(file_path)
        partial_name = path + "/" + name[1, name.index('.') - 1]
        {
          name: partial_name,
          content: render_template(partial_name),
        }
      end
    end

    #
    # @param partial_name template partial name
    # @return template content
    #
    def render_template(partial_name)
      @view_ctx.render partial_name
    end
  end

  #
  # Render all templates in given path
  #
  def ng_template_include(paths)
    TemplateRenderer.new(self, paths).render
  end
end
end
