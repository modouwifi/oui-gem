module OUI
  class Database
    @@file = File.read(File.expand_path('../../../data/oui.txt', __FILE__))

    @@oui_to_organization_names = {}

    @@file.each_line do |line|
      if line =~ /(#{MACAddress.oui_regex})\s+\(hex\)\s+(.+)/
        @@oui_to_organization_names[$1] = $2
      end
    end

    class << self
      def look_up_organization_by_oui(oui)
        organization = Organization.new
        organization.name = @@oui_to_organization_names[oui]
        organization
      end
    end
  end
end
