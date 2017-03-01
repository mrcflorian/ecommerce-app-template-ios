//
//  ATCFacebookPost.swift
//  AppTemplatesCore
//
//  Created by Florian Marcu on 2/2/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import ObjectMapper

class ATCFacebookPost: ATCBaseModel {

    var link: String?
    var createdTime: String?
    var description: String?
    var picture: String?
    var name: String?

    public required init?(map: Map) {

    }

    public func mapping(map: Map) {
        link            <- map["link"]
        createdTime     <- map["created_time"]
        description     <- map["description"]
        name            <- map["name"]
        picture         <- map["picture"]
    }
}
