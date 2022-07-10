//
//  UITestingURLProtocol.swift
//  
//
//  Created by Toomas Vahter on 09.07.2022.
//

import Foundation

final class UITestingURLProcotol: URLProtocol {
    override class func canInit(with request: URLRequest) -> Bool {
        return true // TODO: only return true for requests we have mocked data
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    struct ResponseData {
        let response: URLResponse
        let data: Data
    }
    
    static var responseProvider: ((URLRequest) -> Result<ResponseData, Error>)?
    
    override func startLoading() {
        guard let client else { fatalError() }
        
        if let responseProvider = Self.responseProvider {
            switch responseProvider(request) {
            case .success(let responseData):
                client.urlProtocol(self, didReceive: responseData.response, cacheStoragePolicy: .notAllowed)
                client.urlProtocol(self, didLoad: responseData.data)
                client.urlProtocolDidFinishLoading(self)
            case .failure(let error):
                client.urlProtocol(self, didFailWithError: error)
                client.urlProtocolDidFinishLoading(self)
            }
        }
        else {
            let error = NSError(domain: "UITestingURLProcotol", code: -1)
            client.urlProtocol(self, didFailWithError: error)
        }
    }
    
    override func stopLoading() {}
}
