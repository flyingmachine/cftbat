require 'asciidoctor'
require 'erb'

module Nanoc::Asciidoctor

  class Filter < Nanoc::Filter

    identifier :asciidoctor

    def run(content, params={})
      d = Asciidoctor::Document.new(content)
      d.attributes["showtitle"] = true
      d.render(params)
    end

  end

end
