//
//  UserDefaults.swift
//  IVPN Client
//
//  Created by Juraj Hilje on 22/10/2018.
//  Copyright © 2018 IVPN. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    static var shared: UserDefaults {
        return UserDefaults(suiteName: Config.appGroup)!
    }
    
    struct Key {
        static let wireguardTunnelProviderError = "wireguardTunnelProviderError"
        static let openvpnTunnelProviderError = "TunnelKitLastError"
        static let isMultiHop = "isMultiHop"
        static let exitServerLocation = "exitServerLocation"
        static let isLogging = "isLogging"
        static let isLoggingCrashes = "isLoggingCrashes"
        static let networkProtectionEnabled = "networkProtection.enabled"
        static let networkProtectionUntrustedConnect = "networkProtection.untrusted.connect"
        static let networkProtectionTrustedDisconnect = "networkProtection.trusted.disconnect"
        static let isCustomDNS = "isCustomDNS"
        static let customDNS = "customDNS"
        static let isAntiTracker = "isAntiTracker"
        static let isAntiTrackerHardcore = "isAntiTrackerHardcore"
        static let antiTrackerDNS = "antiTrackerDNS"
        static let antiTrackerDNSMultiHop = "antiTrackerDNSMultiHop"
        static let antiTrackerHardcoreDNS = "antiTrackerHardcoreDNS"
        static let antiTrackerHardcoreDNSMultiHop = "antiTrackerHardcoreDNSMultiHop"
        static let wgKeyTimestamp = "wgKeyTimestamp"
        static let wgRegenerationRate = "wgRegenerationRate"
        static let localIpAddress = "localIpAddress"
        static let hostNames = "hostNames"
        static let apiHostName = "apiHostName"
        static let hasUserConsent = "hasUserConsent"
        static let sessionsLimit = "sessionsLimit"
        static let upgradeToUrl = "upgradeToUrl"
        static let connectionStatus = "connectionStatus"
        static let connectionLocation = "connectionLocation"
        static let connectionIpAddress = "connectionIpAddress"
        static let keepAlive = "keepAlive"
    }
    
    @objc dynamic var wireguardTunnelProviderError: String {
        return string(forKey: Key.wireguardTunnelProviderError) ?? ""
    }
    
    @objc dynamic var openvpnTunnelProviderError: String {
        return string(forKey: Key.openvpnTunnelProviderError) ?? ""
    }
    
    @objc dynamic var isMultiHop: Bool {
        return bool(forKey: Key.isMultiHop)
    }
    
    @objc dynamic var exitServerLocation: String {
        return string(forKey: Key.exitServerLocation) ?? ""
    }
    
    @objc dynamic var isLogging: Bool {
        return bool(forKey: Key.isLogging)
    }
    
    @objc dynamic var isLoggingCrashes: Bool {
        return bool(forKey: Key.isLoggingCrashes)
    }
    
    @objc dynamic var networkProtectionEnabled: Bool {
        return bool(forKey: Key.networkProtectionEnabled)
    }
    
    @objc dynamic var networkProtectionUntrustedConnect: Bool {
        return bool(forKey: Key.networkProtectionUntrustedConnect)
    }
    
    @objc dynamic var networkProtectionTrustedDisconnect: Bool {
        return bool(forKey: Key.networkProtectionTrustedDisconnect)
    }
    
    @objc dynamic var isCustomDNS: Bool {
        return bool(forKey: Key.isCustomDNS)
    }
    
    @objc dynamic var customDNS: String {
        return string(forKey: Key.customDNS) ?? ""
    }
    
    @objc dynamic var isAntiTracker: Bool {
        return bool(forKey: Key.isAntiTracker)
    }
    
    @objc dynamic var isAntiTrackerHardcore: Bool {
        return bool(forKey: Key.isAntiTrackerHardcore)
    }
    
    @objc dynamic var antiTrackerDNS: String {
        return string(forKey: Key.antiTrackerDNS) ?? ""
    }
    
    @objc dynamic var antiTrackerDNSMultiHop: String {
        return string(forKey: Key.antiTrackerDNSMultiHop) ?? ""
    }
    
    @objc dynamic var antiTrackerHardcoreDNS: String {
        return string(forKey: Key.antiTrackerHardcoreDNS) ?? ""
    }
    
    @objc dynamic var antiTrackerHardcoreDNSMultiHop: String {
        return string(forKey: Key.antiTrackerHardcoreDNSMultiHop) ?? ""
    }
    
    @objc dynamic var wgKeyTimestamp: Date {
        if let date = object(forKey: Key.wgKeyTimestamp) as? Date {
            return date
        }
        
        return Date()
    }
    
    @objc dynamic var wgRegenerationRate: Int {
        return integer(forKey: Key.wgRegenerationRate)
    }
    
    @objc dynamic var localIpAddress: String {
        return string(forKey: Key.localIpAddress) ?? ""
    }
    
    @objc dynamic var hostNames: [String] {
        return stringArray(forKey: Key.hostNames) ?? []
    }
    
    @objc dynamic var apiHostName: String {
        return string(forKey: Key.apiHostName) ?? Config.ApiHostName
    }
    
    @objc dynamic var hasUserConsent: Bool {
        return bool(forKey: Key.hasUserConsent)
    }
    
    @objc dynamic var sessionsLimit: Int {
        return integer(forKey: Key.sessionsLimit)
    }
    
    @objc dynamic var upgradeToUrl: String {
        return string(forKey: Key.upgradeToUrl) ?? ""
    }
    
    @objc dynamic var keepAlive: Bool {
        return bool(forKey: Key.keepAlive)
    }
    
    static func registerUserDefaults() {
        shared.register(defaults: [UserDefaults.Key.networkProtectionUntrustedConnect: true])
        shared.register(defaults: [UserDefaults.Key.networkProtectionTrustedDisconnect: true])
        shared.register(defaults: [UserDefaults.Key.keepAlive: true])
        shared.register(defaults: [UserDefaults.Key.isLoggingCrashes: true])
        shared.register(defaults: [UserDefaults.Key.wgRegenerationRate: Config.wgKeyRegenerationRate])
        shared.register(defaults: [UserDefaults.Key.wgKeyTimestamp: Date()])
        standard.register(defaults: ["SelectedServerFastest": true])
    }
    
    static func clearSession() {
        shared.removeObject(forKey: UserDefaults.Key.isMultiHop)
        shared.removeObject(forKey: UserDefaults.Key.isLogging)
        shared.removeObject(forKey: UserDefaults.Key.isLoggingCrashes)
        shared.removeObject(forKey: UserDefaults.Key.networkProtectionEnabled)
        shared.removeObject(forKey: UserDefaults.Key.networkProtectionUntrustedConnect)
        shared.removeObject(forKey: UserDefaults.Key.networkProtectionTrustedDisconnect)
        shared.removeObject(forKey: UserDefaults.Key.isCustomDNS)
        shared.removeObject(forKey: UserDefaults.Key.isAntiTracker)
        shared.removeObject(forKey: UserDefaults.Key.isAntiTrackerHardcore)
        shared.removeObject(forKey: UserDefaults.Key.wgKeyTimestamp)
        shared.removeObject(forKey: UserDefaults.Key.wgRegenerationRate)
        shared.removeObject(forKey: UserDefaults.Key.localIpAddress)
        shared.removeObject(forKey: UserDefaults.Key.apiHostName)
        shared.removeObject(forKey: UserDefaults.Key.sessionsLimit)
        shared.removeObject(forKey: UserDefaults.Key.keepAlive)
        standard.removeObject(forKey: "SelectedServerFastest")
        standard.removeObject(forKey: "FastestServerConfiguredForOpenVPN")
        standard.removeObject(forKey: "FastestServerConfiguredForWireGuard")
        standard.synchronize()
    }
    
}
