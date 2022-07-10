//
//  UITestingNetworkHandler.swift
//  
//
//  Created by Toomas Vahter on 09.07.2022.
//

import Foundation

public final class UITestingNetworkHandler {
    public static func register() {
        URLProtocol.registerClass(UITestingURLProcotol.self)
        
        UITestingURLProcotol.responseProvider = { request in
            guard let url = request.url else { fatalError() }
            switch (url.host, url.path) {
            case ("augmentedcode.io", "/api/example"):
                let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
                let data = "MyMockedData".data(using: .utf8)!
                return .success(UITestingURLProcotol.ResponseData(response: response, data: data))
            default:
                fatalError("Unhandled")
            }
        }
    }
}
