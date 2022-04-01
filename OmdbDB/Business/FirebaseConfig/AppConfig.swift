//
//  AppConfig.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 1.04.2022.
//

import Foundation
import FirebaseRemoteConfig

typealias AppConfigCompletionHandler = (String?) -> Void

final class AppConfig {
    
    static let shared = AppConfig()
    
    private var remoteConfig: RemoteConfig
    
    private init() {
        self.remoteConfig = RemoteConfig.remoteConfig()
    }
    
    func fetchAppConfig(with key: Configurations, completion: @escaping AppConfigCompletionHandler) {
        let defaults: [String: NSObject] = [
            key.rawValue: "" as NSObject
        ]
        
        self.remoteConfig.setDefaults(defaults)
        
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        
        self.remoteConfig.configSettings = settings
        
        self.remoteConfig.fetch(withExpirationDuration: 0) { status, error in
            if status == .success, error == nil {
                
                self.remoteConfig.activate { isSuccess, error in
                    guard error == nil else {
                        completion(nil)
                        return
                    }
                    let value = self.remoteConfig.configValue(forKey: key.rawValue).stringValue
                    completion(value)
                }
            } else {
                completion(nil)
            }
        }
    }
}
