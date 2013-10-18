# Take a folder from post
# For each item in array generate correspending -thumb.ext and save to folder
# generate a ul > li > a > img list with a hrefing to the fullsize with rel option for type of lightbox
# eg: { album book1,colorbox }

require "mini_magick"

module Jekyll
  class MagaAlbum < Liquid::Tag


    def initialize(tag_name, markup, tokens)
      @folder = markup.split(",")[0].strip
      @rel = markup.split(",")[1].strip
      # @folder = markup
      super
    end

    def render(context)
      @thumbs = []
      @vanilla = []
      @torender = "<div id='gallery'>"

      Dir.entries("images/#{@folder}/").each do |i|
        unless i == "." or i == ".." or i ==".DS_Store"
          image = MiniMagick::Image.open(File.join("images/#{@folder}/", i))
          image.resize "200x200"
          @name = File.basename(i,File.extname(i))
          image.write "images/#{@folder}/#{@name}-thumb#{File.extname(i)}"
          @vanilla << i
          @thumbs << "#{@name}-thumb#{File.extname(i)}"
          @torender += "<img src='images/#{@folder}/#{@name}-thumb#{File.extname(i)}'>"
        end
      end
      @torender += "</div>"
      @torender
    end

  end
end

Liquid::Template.register_tag('magaalbum', Jekyll::MagaAlbum)