//
//  ContentView.swift
//  SomeSwiftUICustom
//
//  Created by Omid Shojaeian Zanjani on 11/10/23.
//

import SwiftUI
// init commmit in 11 October 2023 - 14:39 at Federico University

/*
 reference link: https://stackoverflow.com/questions/57688242/swiftui-how-to-change-the-placeholder-color-of-the-textfield
 
 
 Here I coded a custom TextField for SwiftUI to show placeholder
 first I extended a function as "placeHolder" to view
 second this function works like a modifies to  generate another view as TextField to shoe placeHolde
 Third: to show placeHolder I used ZStack to show two text on each other first PlaceHolderText ( can be another View)
 then main view I mean Textfield
 
 to hide placeholder text after writing I used Binding variable when it is empty show placeholder with 0 opacity
 */
struct ContentView: View {
    @State var textFromUSer:String = ""
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            TextField("", text: $textFromUSer)
                .placeHolder(isShowing: textFromUSer.isEmpty, alignment: .leading) {
                    Text("Placeholder text is here ....")
                }
        }
        .padding()
    }
}


extension View {
    func placeHolder<Content:View> (isShowing:Bool, alignment:Alignment = .leading, @ViewBuilder placeholder:()->Content) -> some View {
        ZStack(alignment: alignment){
            placeholder().opacity( isShowing ? 0.4 : 0.0 )
            self
        }
    }
}
#Preview {
    ContentView()
}
