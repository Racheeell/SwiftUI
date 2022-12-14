//
//  ContentView.swift
//  Demo-Gestures
//
//  Created by Mohammad Azam on 6/24/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State private var tapped: Bool = false
    @State private var cardDragState = CGSize.zero
    @State private var cardRotateState: Double = 0
    
    var body: some View {
        Card(tapped: self.tapped)
            .animation(.spring())
            .offset(y: self.cardDragState.height)
            .rotationEffect(Angle(degrees: self.cardRotateState))
            
            .gesture(RotationGesture()
                .onChanged { value in
                    self.cardRotateState = value.degrees
                }
            )
            
            .gesture(DragGesture()
                .onChanged { value in
                    self.cardDragState =  value.translation
                }
                .onEnded { value in
                    self.cardDragState = CGSize.zero
                }
            )
            
            .gesture(TapGesture(count: 1)
                .onEnded({ () in
                    self.tapped.toggle()
                })
        )
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
