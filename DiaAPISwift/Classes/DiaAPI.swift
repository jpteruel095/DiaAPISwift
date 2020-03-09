//
//  DiaAPI+Endpoint.swift
//  DiaAPISwift
//
//  Created by John Patrick Teruel on 3/9/20.
//

import Alamofire
import SwiftyJSON

public protocol RequestProtocol{
    func getParameters() -> Parameters
}

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
    func request(parameters: Parameters? = nil,
                 progressCallback:((Progress) -> Void)? = nil,
                 completion:((JSON?, Error?) -> Void)? = nil,
                 shouldLog: Bool = true,
                 shouldLogResult: Bool = true){
        
    }
    
    func request(request: RequestProtocol?,
                 progressCallback:((Progress) -> Void)?,
                 completion:((JSON?, Error?) -> Void)?,
                 shouldLog: Bool,
                 shouldLogResult: Bool){
        self.request(parameters: request?.getParameters(),
                     progressCallback: progressCallback,
                     completion: completion,
                     shouldLog: shouldLog,
                     shouldLogResult: shouldLogResult)
    }
    
    func request(request: RequestProtocol?,
                 progressCallback:((Progress) -> Void)?,
                 completion:((JSON?, Error?) -> Void)?){
        self.request(parameters: request?.getParameters(),
                     progressCallback: progressCallback,
                     completion: completion,
                     shouldLog: true,
                     shouldLogResult: true)
    }
    
    func request(request: RequestProtocol?,
                 completion:((JSON?, Error?) -> Void)?){
        self.request(parameters: request?.getParameters(),
                     progressCallback: nil,
                     completion: completion,
                     shouldLog: true,
                     shouldLogResult: true)
    }
    
    func request(completion:((JSON?, Error?) -> Void)?){
        self.request(parameters: nil,
                     progressCallback: nil,
                     completion: completion,
                     shouldLog: true,
                     shouldLogResult: true)
    }
}
