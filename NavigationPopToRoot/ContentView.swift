//
//  ContentView.swift
//  NavigationPopToRoot
//
//  Created by Mitchell Hudson on 3/1/21.
//

import SwiftUI


struct ContentView: View {
  @EnvironmentObject var env: AppController
  @State var isActive : Bool = false

  var body: some View {
    NavigationView {
      NavigationLink(
        destination: ContentView2(shouldPopToRootView: self.$isActive),
        isActive: self.$isActive
      ) {
        Text("Play Game")
      }
      .isDetailLink(false)
      .navigationBarTitle("Root")
    }
  }
}

// ---------------------------------------------

struct ContentView2: View {
  @EnvironmentObject var env: AppController
  @Binding var shouldPopToRootView : Bool

  var body: some View {
    VStack {
      Text("You are playing the game \(env.countDown)")
      Spacer(minLength: 20)
      Button(action: {
        env.startTimer()
      }, label: {
        Text("Start Timer")
          .padding(40)
      })
    }.navigationBarTitle("Game")
    .onChange(of: env.timesUp, perform: { value in
      self.shouldPopToRootView = false
    })
  }
}

// ---------------------------------------------

struct ContentView3: View {
  @EnvironmentObject var env: AppController
  @Binding var shouldPopToRootView : Bool

  var body: some View {
    VStack {
//      if env.timesUp {
//        self.shouldPopToRootView = false
//      }
      Text("Hello, World #3!")
      Button (action: { self.shouldPopToRootView = false } ){
        Text("Pop to root")
      }
    }.navigationBarTitle("Three")
  }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppController())
    }
}
