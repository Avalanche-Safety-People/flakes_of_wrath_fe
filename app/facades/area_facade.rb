class AreaFacade

  def self.all_zones
    zones_data = AreasService.zones
    zones_data[:data].map do |area|

      Area.new(area)
    end
  end

  def self.find_zone(zone_id)
    zone_data = AreasService.find_zone(zone_id)

    Area.new(zone_data[:data])
  end
end
