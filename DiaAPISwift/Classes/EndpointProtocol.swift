//
//  DiaAPI+Endpoint.swift
//  DiaAPISwift
//
//  Created by John Patrick Teruel on 3/9/20.
//

import Alamofire
import SwiftyJSON

public protocol EndpointProtocol{
    ///Request with Alamofire Parameters, Progress Callback, Completion Callback, and flags to Log request and result
    func request(parameters: Parameters?,
                 progressCallback:((Progress) -> Void)?,
                 completion:((JSON?, Error?) -> Void)?,
                 shouldLog: Bool,
                 shouldLogResult: Bool)
    
    ///Request with Request Protocol, Progress Callback, Completion Callback, and flags to Log request and result
    func request(request: RequestProtocol?,
                 progressCallback:((Progress) -> Void)?,
                 completion:((JSON?, Error?) -> Void)?,
                 shouldLog: Bool,
                 shouldLogResult: Bool)
    
    ///Request with Request Protocol and with progress callback, logged by default
    func request(request: RequestProtocol?,
                 progressCallback:((Progress) -> Void)?,
                 completion:((JSON?, Error?) -> Void)?)
    
    ///Request with Request Protocol and without progress callback, logged by default
    func request(request: RequestProtocol?,
                 completion:((JSON?, Error?) -> Void)?)
    
    ///Request with completion callback only, logged by default
    func request(completion:((JSON?, Error?) -> Void)?)
}

public extension EndpointProtocol{
    /**
     Request with Alamofire Parameters, Progress Callback, Completion Callback, and flags to Log request and result
     - parameters:
        - parameters: The parameters for the request.
        - progressCallback: Callback that returns the progress of the current request.
        - completion: Callback for the response of the request.
        - shouldLog: Specified to allow the current requet log before request and response.
        - shouldLogResult: If request is allowed to log, user can choose to not log the result.
     */
    func request(parameters: Parameters? = nil,
                 progressCallback:((Progress) -> Void)? = nil,
                 completion:((JSON?, Error?) -> Void)? = nil,
                 shouldLog: Bool = true,
                 shouldLogResult: Bool = true){
                     //The developer can choose to log the request
                     // or not.
                     if shouldLog{
//                         print("Request URL: \(route.url.absoluteString)")
//                         print("Header: \(headers.toJSONString())")
//                         print("Method: \(httpMethod.rawValue)")
                         if let parameters = parameters{
                             print("Parameters: \(parameters)")
                         }
                     }
    }
    
    /**
     Request with Request Protocol, Progress Callback, Completion Callback, and flags to Log request and result
     - parameters:
        - request: The request with pre-loaded parameters for struct.
        - progressCallback: Callback that returns the progress of the current request.
        - completion: Callback for the response of the request.
        - shouldLog: Specified to allow the current requet log before request and response.
        - shouldLogResult: If request is allowed to log, user can choose to not log the result.
     */
    func request(request: RequestProtocol? = nil,
                 progressCallback:((Progress) -> Void)? = nil,
                 completion:((JSON?, Error?) -> Void)? = nil,
                 shouldLog: Bool = true,
                 shouldLogResult: Bool = true){
        self.request(parameters: request?.getParameters(),
                     progressCallback: progressCallback,
                     completion: completion,
                     shouldLog: shouldLog,
                     shouldLogResult: shouldLogResult)
    }
}
