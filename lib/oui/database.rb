module OUI
  class Database

    def initialize
      @@file = File.read(File.expand_path('../../../data/oui.txt', __FILE__))
      @@oui_to_organization_names = {}

      @@file.each_line do |line|
        regex = /(#{MACAddress.oui_regex_string})\s+\(hex\)\s+(.+)/
        if line =~ regex
          @@oui_to_organization_names[$1] = $2
        end
      end
    end

    def look_up_organization_by_oui(oui)
      organization = Organization.new
      organization.name = @@oui_to_organization_names[oui.upcase]
      organization.chinese_name = Translator.translate(organization.name)
      organization
    end

    class << self
      def look_up_organization_by_oui(oui)
        @@instance ||= new

        @@instance.look_up_organization_by_oui(oui)
      end
    end
  end
end
