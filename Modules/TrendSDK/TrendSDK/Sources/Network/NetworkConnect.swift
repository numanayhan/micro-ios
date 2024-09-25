//
//  NetworkStatus.swift
//  TrendSDK
//
//  Created by mba on 25.09.2024.
//  Copyright © 2024 na. All rights reserved.
//
import SystemConfiguration


public class NetworkConnect {
    public static func isConnected() -> Bool {
        // Kodlar
        /*
        var zeroAddress = sockaddr()
        zeroAddress.sa_len = UInt8(MemoryLayout<sockaddr>.size)
        zeroAddress.sa_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        }) else { return false }
        
        var flags = SCNetworkReachabilityFlags()
        guard SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) else { return false }
        */
        return true //flags.contains(.reachable) && !flags.contains(.connectionRequired)
    }
}
