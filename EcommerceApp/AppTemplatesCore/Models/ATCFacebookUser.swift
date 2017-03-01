//
//  ATCFacebookUser.swift
//  AppTemplatesCore
//
//  Created by Florian Marcu on 2/2/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import ObjectMapper

class ATCFacebookUser: ATCBaseModel {

    var firstName: String?
    var lastName: String?
    var email: String?
    var id: String?
    var profilePicture: String?

    public required init?(map: Map) {

    }

    public func mapping(map: Map) {
        firstName       <- map["first_name"]
        lastName        <- map["last_name"]
        email           <- map["email"]
        id              <- map["id"]
        profilePicture  <- map["picture.data.url"]
    }
}
