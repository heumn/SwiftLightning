//
//  WalletMainRouter.swift
//  SwiftLightning
//
//  Created by Howard Lee on 2018-04-20.
//  Copyright (c) 2018 BiscottiGelato. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol WalletMainRoutingLogic {
  func routeToPayMain()
  func routeToReceiveMain()
  func routeToChannelDetails(channelVM: ChannelVM)
}

protocol WalletMainDataPassing {
  var dataStore: WalletMainDataStore? { get }
}

class WalletMainRouter: WalletMainRoutingLogic, WalletMainDataPassing {
  weak var viewController: WalletMainViewController?
  var dataStore: WalletMainDataStore?
  
  
  // MARK: Routing
  
  func routeToPayMain() {
    let storyboard = UIStoryboard(name: "PayMain", bundle: nil)
    let destinationVC = storyboard.instantiateViewController(withIdentifier: "PayMainViewController") as! PayMainViewController
    var destinationDS = destinationVC.router!.dataStore!
    passDataToPayMain(source: dataStore!, destination: &destinationDS)
    navigateToPayMain(source: viewController!, destination: destinationVC)
  }
  
  func routeToReceiveMain() {
    let storyboard = UIStoryboard(name: "ReceiveMain", bundle: nil)
    let destinationVC = storyboard.instantiateViewController(withIdentifier: "ReceiveMainViewController") as! ReceiveMainViewController
    var destinationDS = destinationVC.router!.dataStore!
    passDataToReceiveMain(source: dataStore!, destination: &destinationDS)
    navigateToReceiveMain(source: viewController!, destination: destinationVC)
  }

  func routeToChannelDetails(channelVM: ChannelVM) {
    let storyboard = UIStoryboard(name: "ChannelDetails", bundle: nil)
    let destinationVC = storyboard.instantiateViewController(withIdentifier: "ChannelDetailsViewController") as! ChannelDetailsViewController
    var destinationDS = destinationVC.router!.dataStore!
    passDataToChannelDetails(channelVM: channelVM, destination: &destinationDS)
    navigateToChannelDetails(source: viewController!, destination: destinationVC)
  }
  
  
  // MARK: Navigation
  
  func navigateToPayMain(source: WalletMainViewController, destination: PayMainViewController) {
    guard let navigationController = source.navigationController else {
      SLLog.assert("\(type(of: source)).navigationController = nil")
      return
    }
    navigationController.pushViewController(destination, animated: true)
  }
  
  func navigateToReceiveMain(source: WalletMainViewController, destination: ReceiveMainViewController) {
    guard let navigationController = source.navigationController else {
      SLLog.assert("\(type(of: source)).navigationController = nil")
      return
    }
    navigationController.pushViewController(destination, animated: true)
  }
  
  func navigateToChannelDetails(source: WalletMainViewController, destination: ChannelDetailsViewController) {
    guard let navigationController = source.navigationController else {
      SLLog.assert("\(type(of: source)).navigationController = nil")
      return
    }
    navigationController.pushViewController(destination, animated: true)
  }
  
  
  // MARK: Passing data
  
  func passDataToPayMain(source: WalletMainDataStore, destination: inout PayMainDataStore) {
    // destination.name = source.name
  }
  
  func passDataToReceiveMain(source: WalletMainDataStore, destination: inout ReceiveMainDataStore) {
    // destination.name = source.name
  }
  
  func passDataToChannelDetails(channelVM: ChannelVM, destination: inout ChannelDetailsDataStore) {
    destination.channelVM = channelVM
  }
}
