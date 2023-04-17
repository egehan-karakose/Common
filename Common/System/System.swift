//
//  System.swift
//  Common
//
//  Created by Egehan KARAKÖSE (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 27.03.2022.
//

import Foundation
import AdSupport

private var appSystemInfoInstance: System!

public class System {
    
    public private(set) var appLaunchTimestamp: Int64 = 0
    public private(set) var token: String? // This can be both client and authentication. Auth token overrides
    public private(set) var version: String!
    
    
    public class func setup() {
        appSystemInfoInstance = System()
    }
    
    public class var shared: System {
        if appSystemInfoInstance == nil {
            System.setup()
        }
        return appSystemInfoInstance
    }
    
    // MARK: - Initialization
    
    private init() {
        self.appLaunchTimestamp = Int64(Date().timeIntervalSince1970 * 1000.0)
        // swiftlint:disable force_cast
        self.version = (Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String)
        // swiftlint:enable force_cast
    }
    
    // MARK: - Public Helpers
    public func login(token: String) {
        // Auth token overrides client token value.
        self.token = token
        AppDefaults.shared.storeString(with: .token, value: token)
    }
   
    public func resetToken() {
        token = nil
        AppDefaults.shared.clear(key: .token)
    }
    
    public func getToken() -> String? {
        token = AppDefaults.shared.retrieveString(with: .token)
        return token
    }
    
    public func isTokenExist() -> Bool {
        token = AppDefaults.shared.retrieveString(with: .token)
        return token != nil
    }
    
}

