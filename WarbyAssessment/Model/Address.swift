//
//  Address.swift
//  WarbyAssessment
//
//  Created by Mac User on 6/19/19.
//

import Foundation

class Address {
    var streetAddress = ""
    var extendedAddress = ""
    var postalCode = ""
    var regionCode = ""
    var regionName = ""
    var locality = ""
    var countryCode = ""
    
    convenience init(data: [String: String]) {
        self.init()
        
        self.streetAddress = data["street_address"] ?? ""
        self.extendedAddress = data["extended_address"] ?? ""
        self.postalCode = data["postal_code"] ?? ""
        self.regionCode = data["region_code"] ?? ""
        self.regionName = data["region_name"] ?? ""
        self.locality = data["locality"] ?? ""
        self.countryCode = data["country_code"] ?? ""
    
    }
    
    func genCityStateZip() -> String {
        return "\(self.locality),\(self.regionCode), \(self.postalCode)"
    }
    
}




