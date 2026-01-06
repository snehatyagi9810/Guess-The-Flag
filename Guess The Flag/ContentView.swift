//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Sneha Tyagi on 06/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            AngularGradient(colors: [.red,.blue,.yellow,.purple,.pink,.brown], center: .center)
            
            
            Text("Radhe Radhe")
                .foregroundStyle(.yellow)
                .background(.ultraThinMaterial)
                .padding(50)
        }
        .ignoresSafeArea()
      
    }
    
    
}

#Preview {
    ContentView()
}
