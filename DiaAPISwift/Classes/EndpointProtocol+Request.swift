//
//  DiaAPI+Endpoint.swift
//  DiaAPISwift
//
//  Created by John Patrick Teruel on 3/9/20.
//

import Alamofire
import SwiftyJSON

public extension EndpointProtocol{
    /**
     Request with Request Protocol and with progress callback, logged by default
     - parameters:
        - request: The request with pre-loaded parameters for struct.
        - progressCallback: Callback that returns the progress of the current request.
        - completion: Callback for the response of the request.
     */
    func request(request: RequestProtocol? = nil,
                 progressCallback:((Progress) -> Void)? = nil,
                 completion:((JSON?, Error?) -> Void)? = nil){
        self.request(parameters: request?.getParameters(),
                     progressCallback: progressCallback,
                     completion: completion,
                     shouldLog: true,
                     shouldLogResult: true)
    }
    
    /**
     Request with Request Protocol and without progress callback, logged by default
     - parameters:
        - request: The request with pre-loaded parameters for struct.
        - completion: Callback for the response of the request.
     */
    func request(request: RequestProtocol? = nil,
                 completion:((JSON?, Error?) -> Void)? = nil){
        self.request(parameters: request?.getParameters(),
                     progressCallback: nil,
                     completion: completion,
                     shouldLog: true,
                     shouldLogResult: true)
    }
    
    /**
     Request with Request Protocol and without progress callback, logged by default
     - parameters:
        - completion: Callback for the response of the request.
     */
    func request(completion:((JSON?, Error?) -> Void)? = nil){
        self.request(parameters: nil,
                     progressCallback: nil,
                     completion: completion,
                     shouldLog: true,
                     shouldLogResult: true)
    }
}
