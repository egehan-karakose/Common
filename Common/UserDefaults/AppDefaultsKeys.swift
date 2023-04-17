//
//  AppDefaultsKeys.swift
//  DareDiceFoundation
//
//  Created by Egehan KARAKÖSE (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 31.05.2022.
//

import Foundation

public enum AppDefaultsKeys {
    case languageKey
    case onboardingShowed
    case environment
    case string(value: String)
    case userKey
    case lastLoggedInUsers
    case isDeviceHasNotch
    case token
    case isShowCaseShowed
    case isCoachMarkedShowed
}

extension AppDefaultsKeys: RawRepresentable {
    
    public typealias RawValue = String
    
    public init?(rawValue: String) {
        fatalError("this enum should not be initialized.")
    }
    
    public var rawValue: String {
        switch self {
        case .string(let value):
            return value
        default:
            return String(describing: self)
        }
    }

}
