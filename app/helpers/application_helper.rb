module ApplicationHelper
    
    # Returns the full title on a per-page basis
    def full_title(page_title = '')
        base_title = "GabeCode"
        if page_title.empty?
            base_title
        else
            page_title + " | " + base_title
        end
    end
    
    # Helper class for CodeRay renderer
    class CodeRayify < Redcarpet::Render::HTML
      def block_code(code, language)
        CodeRay.scan(code, language).div
      end
    end
    
    # Generates HTML from markdown text
    def markdown(content)
        @markdown_renderer ||= CodeRayify.new(:filter_html => true, :hard_wrap => true)
                                
        @markdown_options ||= {
            :fenced_code_blocks => true,
            :no_intra_emphasis => true,
            :autolink => true,
            :lax_html_blocks => true,
        }
        
        @markdown ||= Redcarpet::Markdown.new(@markdown_renderer, @markdown_options)
        @markdown.render(content).html_safe
    end
    
    def force_ssl(options = {})
      host = options.delete(:host)
      unless request.ssl? or Rails.env.development?
        redirect_options = {:protocol => 'https://', :status => :moved_permanently}
        redirect_options.merge!(:host => host) if host
        flash.keep
        redirect_to redirect_options and return
      else
        true
      end
    end
end
