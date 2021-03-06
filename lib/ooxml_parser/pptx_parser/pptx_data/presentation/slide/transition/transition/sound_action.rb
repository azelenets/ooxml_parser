require_relative 'sound_action/sound'
module OoxmlParser
  # Class for parsing SoundAction
  class SoundAction < OOXMLDocumentObject
    attr_accessor :start_sound, :end_sound

    # Parse HyperlinkForHover
    # @param [Nokogiri::XML:Node] node with NumberingProperties
    # @return [HyperlinkForHover] result of parsing
    def parse(node)
      node.xpath('*').each do |node_child|
        case node_child.name
        when 'stSnd'
          @start_sound = Sound.new(parent: self).parse(node_child.xpath('p:snd').first) unless node_child.xpath('p:snd').first.nil?
        when 'endSnd'
          @end_sound = Sound.new(parent: self).parse(node_child.xpath('p:snd').first) unless node_child.xpath('p:snd').first.nil?
        end
      end
      self
    end
  end
end
