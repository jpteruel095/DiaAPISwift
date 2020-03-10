//
//  DiaAPI+Endpoint.swift
//  DiaAPISwift
//
//  Created by John Patrick Teruel on 3/9/20.
//

import Alamofire
import SwiftyJSON

public struct DiaAPI{
    struct Constants{
        static var host: String!
    }
    
    public func configure(host: String){
        // https://www.example.com/
        Constants.host = host
    }
}

public protocol EndpointProtocol{
    var path: String { get }
    var method: HTTPMethod { get }
    
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
    var method: HTTPMethod{
        return .get
    }
    var url: URL{
        let host = DiaAPI.Constants.host!
        return URL(string: "\(host)\(path)")!
    }
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
        var headers: HTTPHeaders?
        //check if endpoint requires headers
        let requiresHeaders = false
        if requiresHeaders && headers == nil{
            completion?(nil, APIError.headersRequired)
            return
        }
        
        //The developer can choose to log the request
        // or not.
        if shouldLog{
            print("Request URL: \(url.absoluteString)")
            if let headers = headers{
                print("Header: \(headers.toJSONString())")
            }
            print("Method: \(method.rawValue)")
            if let parameters = parameters{
                print("Parameters: \(parameters.toJSONString())")
            }
        }
    }
}
