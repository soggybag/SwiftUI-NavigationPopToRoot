//
//  AppController.swift
//  NavigationPopToRoot
//
//  Created by Mitchell Hudson on 3/1/21.
//

import Foundation


class AppController: ObservableObject {
  @Published var timesUp = false
  @Published var widget: Int = 0
  
  var timer = Timer()
  var countDown: Int = 3
  
  
  init() {
    
  }
  
  func startTimer() {
    countDown = 3
    timesUp = false
    timer.invalidate()
    timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { (timer) in
      self.goHome()
    })
  }
  
  func goHome() {
    print("Go Home!")
    widget += 1
    timesUp = true
  }
}
