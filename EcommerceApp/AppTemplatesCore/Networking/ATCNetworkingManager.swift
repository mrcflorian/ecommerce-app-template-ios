//
//  ATCNetworkingManager.swift
//  AppTemplatesCore
//
//  Created by Florian Marcu on 2/2/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import Alamofire
import AlamofireRSSParser

public enum ATCNetworkResponseStatus {
    case success
    case error(string: String?)
}

public class ATCNetworkingManager {

    func getJSONResponse(path: String, parameters: [String:String]?, completionHandler: @escaping (_ response: Any?,_ status: ATCNetworkResponseStatus) -> Void) {
        Alamofire.request(path).responseJSON { response in
            if let json = response.result.value {
                completionHandler(json, .success)
            } else {
                completionHandler(nil, .error(string: response.result.error?.localizedDescription))
            }
        }
    }

    func getRSSFeedResponse(path: String, parameters: [String:String]?, completionHandler: @escaping (_ response: RSSFeed?,_ status: ATCNetworkResponseStatus) -> Void) {
        Alamofire.request(path).responseRSS() { response in
            if let rssFeedXML = response.result.value {
                completionHandler(rssFeedXML, .success)
            } else {
                completionHandler(nil, .error(string: response.result.error?.localizedDescription))
            }
        }
    }

    func get(path: String, params: [String:String]?, completion: @escaping ((_ jsonResponse: Any?, _ responseStatus: ATCNetworkResponseStatus) -> Void)) {

        Alamofire.request(path, parameters: params).responseJSON { response in
            if let json = response.result.value {
                completion(json, .success)
            } else {
                completion(nil, .error(string: response.result.error?.localizedDescription))
            }
        }
    }

}
