//
//  NotificationName.swift
//  IVPN Client
//
//  Created by Juraj Hilje on 06/12/2018.
//  Copyright © 2018 IVPN. All rights reserved.
//

import Foundation

extension Notification.Name {
    
    public static let ServerSelected = Notification.Name("serverSelected")
    public static let Disconnect = Notification.Name("disconnect")
    public static let TurnOffMultiHop = Notification.Name("turnOffMultiHop")
    public static let UpdateNetwork = Notification.Name("updateNetwork")
    public static let PingDidComplete = Notification.Name("pingDidComplete")
    public static let NetworkSaved = Notification.Name("networkSaved")
    public static let TermsOfServiceAgreed = Notification.Name("termsOfServiceAgreed")
    public static let SubscriptionDismissed = Notification.Name("subscriptionDismissed")
    public static let SubscriptionActivated = Notification.Name("subscriptionActivated")
    public static let ServiceAuthorized = Notification.Name("serviceAuthorized")
    public static let AuthenticationDismissed = Notification.Name("authenticationDismissed")
    public static let NewSession = Notification.Name("newSession")
    public static let ForceNewSession = Notification.Name("forceNewSession")
    public static let ConnectError = Notification.Name("connectError")
    public static let ShowLogin = Notification.Name("showLogin")
    public static let ShowCreateAccount = Notification.Name("showCreateAccount")
    
}
