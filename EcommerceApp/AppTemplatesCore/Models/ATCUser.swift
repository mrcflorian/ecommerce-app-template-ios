//
//  ATCUser.swift
//  AppTemplatesCore
//
//  Created by Florian Marcu on 2/2/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import ObjectMapper

open class ATCUser: ATCBaseModel {

    var uid: String?
    var username: String?
    var email: String?
    var firstName: String?
    var lastName: String?
    var profilePictureURL: String?

    public init(uid: String = "", firstName: String, lastName: String, avatarURL: String = "", email: String = "") {
        self.firstName = firstName
        self.lastName = lastName
        self.uid = uid
        self.email = email
        profilePictureURL = avatarURL
    }

    public required init?(map: Map) {

    }

    public func mapping(map: Map) {
        username            <- map["username"]
        email               <- map["email"]
        firstName           <- map["first_name"]
        lastName            <- map["last_name"]
        profilePictureURL   <- map["profile_picture"]
    }

    public func fullName() -> String? {
        guard let firstName = firstName, let lastName = lastName else { return "" }
        return "\(firstName) \(lastName)"
    }
}
