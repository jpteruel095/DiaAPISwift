//
//  APIErrors.swift
//  Alamofire
//
//  Created by John Patrick Teruel on 3/10/20.
//

import Foundation

enum APIError: Error{
    case server //500
    case unauthorized //422
    case forbidden //403
    case expired //401
    case technical
    case headersRequired
    case noInternet //-1009
}

extension APIError: LocalizedError{
    public var errorDescription: String?{
        switch self{
        case .server:
            return "Unknown server error (500)"
        case .unauthorized:
            return "Unauthorized access (422)"
        case .forbidden:
            return "Forbidden access (403)"
        case .expired:
            return "Token expired (401)"
        case .technical:
            return "Technical problems"
        case .headersRequired:
            return "Headers required"
        case .noInternet:
            return "You appear to be offline."
        }
    }
    
    public var code: Int?{
        switch self{
        case .server:
            return 503
        case .unauthorized, .headersRequired:
            return 422
        case .technical:
            return 101
        case .forbidden:
            return 403
        case .expired:
            return 401
        case .noInternet:
            return -1009
        }
    }
}
