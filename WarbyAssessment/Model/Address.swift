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
        
        self.streetAddress = data["streetAddress"] ?? ""
        self.extendedAddress = data["extendedAddress"] ?? ""
        self.postalCode = data["postalCode"] ?? ""
        self.regionCode = data["regionCode"] ?? ""
        self.regionName = data["regionName"] ?? ""
        self.locality = data["locality"] ?? ""
        self.countryCode = data["countryCode"] ?? ""
    
    }
    
}




