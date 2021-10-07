//
//  APIClient.swift
//  MeteorTracker
//
//  Created by Thiago Lourin on 07/10/21.
//

import Foundation

public protocol APIRequest: Encodable {
    var path: String { get }
    
    associatedtype Response: APIResponse
}

public protocol APIResponse: Decodable {}

public enum Result<Value> {
    case success(APIResponse)
    case failure(String)
}

typealias ResultCallback<Value> = (Result<Value>) -> Void

protocol APIClientProtocol {
    func request<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<DataContainer<T.Response>>)
}

class APIClient: APIClientProtocol {
    
    func request<T>(_ request: T, completion: @escaping ResultCallback<DataContainer<T.Response>>) where T : APIRequest {
        
    }
    
}
