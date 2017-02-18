//
//  Category.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 2/18/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

class Category {

    var id: String
    var name: String?
    var imageURL: String?

    init(id: String, name: String, imageUrl: String) {
        self.id = id
        self.name = name
        self.imageURL = imageUrl
    }

    static func mockCategories() -> [Category] {
        return [
            Category(id: "1", name: "DRESSES", imageUrl: "http://iosapptemplates.com/wp-content/uploads/2017/02/ios-ecommerce-app-dresses-shopping-category.png"),
            Category(id: "2", name: "SUITS", imageUrl: "http://iosapptemplates.com/wp-content/uploads/2017/02/ios-ecommerce-app-suits-shopping-category.png"),
            Category(id: "3", name: "T-SHIRTS", imageUrl: "http://iosapptemplates.com/wp-content/uploads/2017/02/ios-ecommerce-app-t-shirts-shopping-category.png"),
            Category(id: "4", name: "WINTER", imageUrl: "http://iosapptemplates.com/wp-content/uploads/2017/02/ios-ecommerce-app-winter-clothes-shopping-category.png")
        ]
    }
}
