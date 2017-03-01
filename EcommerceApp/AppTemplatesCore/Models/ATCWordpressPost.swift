//
//  WordpressPost.swift
//  AppTemplatesFoundation
//
//  Created by Florian Marcu on 2/4/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import AlamofireRSSParser
import ObjectMapper

public class ATCWordpressPost: ATCBaseModel {
    var link: String?
    var title: String?
    var text: String?
    var picture: String?

    public required init?(map: Map) {

    }

    public init(rssItem: RSSItem) {
        self.link = rssItem.link
        self.title = rssItem.title
        self.text = rssItem.content
        self.picture = rssItem.mediaContent
    }

    public func mapping(map: Map) {
        link            <- map["link"]
        title           <- map["title"]
        text            <- map["text"]
        picture         <- map["picture"]
    }
}
