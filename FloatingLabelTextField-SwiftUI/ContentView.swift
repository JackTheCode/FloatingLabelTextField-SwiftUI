//
//  ContentView.swift
//  FloatingLabelTextField-SwiftUI
//
//  Created by phatnt on 6/1/20.
//  Copyright © 2020 phatnt. All rights reserved.
//

import SwiftUI

struct FloatingTextField: View {
    let title: String
    let text: Binding<String>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2.0) {
            Text(title)
            .font(.caption)
            .foregroundColor(Color(.placeholderText))
            .opacity(!text.wrappedValue.isEmpty ? 1 : 0)
            .offset(y: text.wrappedValue.isEmpty ? 20 : 0)
            .scaleEffect(text.wrappedValue.isEmpty ? 1 : 0.75, anchor: .leading)
            TextField(title, text: text)
        }
        .padding(.top, 15)
        .animation(.spring(response: 0.4, dampingFraction: 0.3))
    }
    
}

struct ContentView: View {
    let labels = ["First Name", "Last Name", "Street", "City", "Post Code"]
    @State private var values = Array(repeating: "", count: 5)
    var body: some View {
        List(0..<5) { index in
            FloatingTextField(title: self.labels[index], text: self.$values[index])
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
