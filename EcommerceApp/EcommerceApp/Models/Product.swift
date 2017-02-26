//
//  Product.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 1/21/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

class Product {

    var id: String
    var productName: String?
    var productImageURL: String?
    var productPrice: Double?
    var productDescription: String?
    var productCategory: String?
    var productImages: [String]?

    init(id: String, name: String, imageUrl: String, price: Double, description: String, category: String, images: [String]) {
        self.id = id
        productName = name
        productImageURL = imageUrl
        productPrice = price
        productDescription = description
        productCategory = category
        productImages = images
    }

    static func mockProducts() -> [Product] {
        let images = [
            "https://cdn.tobi.com/product_images/md/1/toast-warmth-inside-hoodie-top.jpg",
            "https://cdn.tobi.com/product_images/md/1/black-street-style-velvet-sweatshirt-hoodie.jpg",
            "https://cdn.tobi.com/product_images/md/1/toast-warmth-inside-hoodie-top.jpg",
            "https://everlane-2.imgix.net/i/891f0d01_2238.jpg?w=576&h=576&q=65&dpr=1"
        ]

        let description = "    To these in the morning, I sent the captain, who was to enter into a parley with them. In a word, to try them and tell me wheather they might be trusted or not to go on board and surprise the ship."
        return [
            Product(id: "12", name: "Traveler Traditional", imageUrl: "http://iosapptemplates.com/wp-content/uploads/2017/02/travelertraditionalsuit.jpeg", price: 278.00, description: description, category: "Suits", images: images),
            Product(id: "13", name: "Ralph Lauren", imageUrl: "http://iosapptemplates.com/wp-content/uploads/2017/02/executivesuits.jpeg", price: 760, description: description, category: "Suits", images: images),
            Product(id: "14", name: "Hugo Boss", imageUrl: "http://iosapptemplates.com/wp-content/uploads/2017/02/hugobosssuit.jpeg", price: 690, description: description, category: "T-Shirt", images: images),
            Product(id: "15", name: "Signature Tailor", imageUrl: "http://iosapptemplates.com/wp-content/uploads/2017/02/signaturetailoredsuit.jpg", price: 999, description: description, category: "Suits", images: images),
            Product(id: "16", name: "Joseph Slim", imageUrl: "http://iosapptemplates.com/wp-content/uploads/2017/02/josephslimsuit.jpeg", price: 459.0, description: description, category: "Suits", images: images),
            Product(id: "122", name: "Jack Victor", imageUrl: "http://iosapptemplates.com/wp-content/uploads/2017/02/jackvictorgibsonsuit.jpg", price: 360, description: description, category: "Suits", images: images),
            Product(id: "123", name: "Calvin Klein", imageUrl: "http://iosapptemplates.com/wp-content/uploads/2017/02/calvinkleinsuit.jpg", price: 780, description: description, category: "Suits", images: images)
        ]
    }
}
