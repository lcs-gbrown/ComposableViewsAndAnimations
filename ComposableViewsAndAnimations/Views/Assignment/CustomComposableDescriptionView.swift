//
//  CustomComposableDescriptionView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct CustomComposableDescriptionView: View {
    
    // MARK: Stored properties
    
    // What to say
    @State private var phrase: String = ""
    
    // What typeface to show phrase in
    @State private var selectedFont: String = ""
    
    @State private var duration: Double = 2.0
    
    // Creates an array of all fonts
    private static let fontNames: [String] = {
        var names = [String]()
        for familyName in UIFont.familyNames {
            names.append(contentsOf: UIFont.fontNames(forFamilyName: familyName))
        }
        return names.sorted()
    }()
    
    // MARK: Computed properties
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Group {
                
                Text("Description")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                
                Text("""
                    A picker for fonts
                    
                    Passes in the chosen flnt and uses it in an ease in and out animation
                    """)
                
                TextField("enter a message here", text: $phrase)
                
                // Example usage #2 - Wheel
                Picker(selection: $selectedFont,
                       label: Text("Picker Name"),
                       content: {
                    
                    ForEach(CustomComposableDescriptionView.fontNames, id: \.self) { currentFont in
                        Text(currentFont)
                            .font(Font.custom(currentFont, size: 17))
                    }
                    
                })
                    .pickerStyle(WheelPickerStyle())
                    .border(Color.black)
                    .padding(.bottom, 5)
                
                Slider(value: $duration, in: 0.2...5, step: 0.1) {
                    Text("Completion amount")
                    
                }
                .padding(.bottom)
                
            Text("Duration of animation will be \(duration)")
                
                List {
                    NavigationLink(destination: CustomComposableViewTwo(message: phrase, font: selectedFont, desiredDuration: duration)) {
                        SimpleListItemView(title: "My Composable View",
                                           caption: "A brief description of my view")
                        
                    }
                }
            }
            
        }
        .padding()
        .navigationTitle("My Composable View")
        
    }
}

struct CustomComposableDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomComposableDescriptionView()
        }
    }
}

