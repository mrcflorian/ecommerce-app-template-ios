//
//  RSSFeed.swift
//  AppTemplatesFoundation
//
//  Created by Florian Marcu on 2/4/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import AlamofireRSSParser

extension RSSFeed {
    func wordpressObjects() -> [ATCWordpressPost] {
        return self.items.map { ATCWordpressPost(rssItem: $0) }
    }
}
