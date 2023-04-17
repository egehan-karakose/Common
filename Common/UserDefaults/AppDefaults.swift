//
//  AppDefaults.swift
//  DareDiceFoundation
//
//  Created by Egehan KARAKÖSE (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 31.05.2022.
//

import Foundation

private var appDefaultsSharedInstance: AppDefaults!

public enum PersistentDomain: String {
    case test
    case production
}

public class AppDefaults {
    
    private var config: PersistentDomain!
    private let defaults: UserDefaults!
    
    public class func setup(with config: PersistentDomain) {
        appDefaultsSharedInstance = AppDefaults(config: config)
    }
    
    public class var shared: AppDefaults {
        if appDefaultsSharedInstance == nil {
            // FIXME: fix it for different targets
            AppDefaults.setup(with: .production)
        }
        return appDefaultsSharedInstance
    }
    
    init(config: PersistentDomain) {
        self.config = config
        defaults = UserDefaults(suiteName: config.rawValue)
    }
    
    // MARK: - Public Helper Methods
    
    public func store<T>(with key: AppDefaultsKeys, value: T) {
        defaults.set(value, forKey: key.rawValue)
    }
    
    public func store<T: Codable>(with key: AppDefaultsKeys, value: T) {
        guard let data = try? JSONEncoder().encode(value) else { return }
        defaults.set(data, forKey: key.rawValue)
    }
    
    public func storeString(with key: AppDefaultsKeys, value: String) {
        defaults.set(value, forKey: key.rawValue)
    }
    
    public func storeInt(with key: AppDefaultsKeys, value: Int) {
        defaults.set(value, forKey: key.rawValue)
    }
    
    public func storeFlag(with key: AppDefaultsKeys, value: Bool) {
        defaults.set(value, forKey: key.rawValue)
    }

    public func retrieve<T>(with key: AppDefaultsKeys) -> T? {
        return defaults.object(forKey: key.rawValue) as? T
    }
    
    public func retrieveFlag(with key: AppDefaultsKeys) -> Bool? {
        return defaults.object(forKey: key.rawValue) as? Bool
    }
    
    public func retrieveInt(with key: AppDefaultsKeys) -> Int? {
        return defaults.integer(forKey: key.rawValue)
    }
    
    public func retrieveString(with key: AppDefaultsKeys) -> String? {
        return defaults.string(forKey: key.rawValue)
    }

    public func retrieve<T: Codable>(with key: AppDefaultsKeys) -> T? {
        
        guard
            let data = defaults.object(forKey: key.rawValue) as? Data,
            let model = try? JSONDecoder().decode(T.self, from: data) else { return nil }

        return model
    }
    
    public func clear(key: AppDefaultsKeys) {
        defaults.removeObject(forKey: key.rawValue)
    }
    
    public func clearAll() {
        defaults.removePersistentDomain(forName: config.rawValue)
        defaults.synchronize()
    }
}
