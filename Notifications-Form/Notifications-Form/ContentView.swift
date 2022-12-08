//
//  ContentView.swift
//  Notifications-Form
//
//  Created by Mohammad Azam on 7/13/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State private var images = ["🗾","🌅","🌄","🌠","🎇","🌇","🗾","🌅","🌄","🌠","🎇","🌇"]
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("")) {
                    
                    HStack {
                        
                        Text("Show Previews")
                        Spacer()
                        NavigationLink(destination: Text("")) {
                            Text("Always").foregroundColor(Color.gray)
                        }.fixedSize()
                        
                    }
                    
                }
                
                Section(header: Text("Notification previews will be shown whether the iPhone is locked or unlocked").foregroundColor(Color.gray).padding(10).lineLimit(nil)) {
                    
                    NavigationLink(destination: Text("")) {
                        Text("Siri Suggestions")
                    }
                    
                }
                
                Section(header: VStack(alignment: .leading) {
                    Text("Choose while apps can suggest shortcuts on the lock screen").lineLimit(nil).padding(2)
                    Text("NOTIFICATION STYLE").padding(2)
                }) {
                    
                    
                    ForEach(self.images, id: \.self) { img in
                        
                        HStack {
                        
                            Text(img)
                                .font(.largeTitle)
                        
                            Text("Notification")
                        }
                    }
                    
                }
                
                .navigationBarTitle("Notifications", displayMode: .inline)
                
            }
            
        }
        
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
