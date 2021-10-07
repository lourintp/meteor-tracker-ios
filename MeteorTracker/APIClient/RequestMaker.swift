//
//  RequestMaker.swift
//  MeteorTracker
//
//  Created by Thiago Lourin on 07/10/21.
//

import Foundation
import Alamofire

public class RequestCreator {
    
    private let method: HTTPMethod
    
    init() {
        self.method = .get
    }
    
    public func get<T: APIRequest>(for request: T, url: String) throws -> URLRequest {
        guard let baseURL = URLComponents(string: try url.asURL().appendingPathComponent(request.path).absoluteString) else {
            fatalError("Bad resource name: \(request.path)")
        }
        
        print("Method \(method.rawValue): \(baseURL)")
        
        guard let url = baseURL.url else { fatalError() }
        var requestData = URLRequest(url: url)
        
        requestData.httpMethod = method.rawValue
        requestData.addValue("application/json", forHTTPHeaderField: "Content-Type")
        requestData.httpBody = try toData(request)
        
        return requestData
    }
    
    private func toData<T: APIRequest>(_ data: T) throws -> Data {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        jsonEncoder.dateEncodingStrategy = .iso8601
            
        return try jsonEncoder.encode(data)
    }
    
}
