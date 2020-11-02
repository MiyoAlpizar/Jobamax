//
//  ContentView.swift
//  Jobamax
//
//  Created by Miyo Alpízar on 31/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var session: SessionStore
    
    func getUser() {
        session.listen()
    }
    
    var body: some View {
        Group {
            if session.session != nil {
                Text("You are in")
                Button("Sign out") {
                    session.sigOut()
                }
            }else {
                WelcomeView().environmentObject(session)
            }
        }.onAppear(perform: {
            getUser()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStore())
    }
}
