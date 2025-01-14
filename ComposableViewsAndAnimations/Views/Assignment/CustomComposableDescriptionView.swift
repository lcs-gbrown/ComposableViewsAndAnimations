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
    
    @State private var textSize: Double = 50
    
    //    @State private var selectedOffsetA: Double = 100
    
    @State private var selectedOffsetB: Double = 100
    
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
                    
                    Passes in the chosen font and uses it in an ease in and out animation. Text can move from top to bottom (or vice versa) based on the slider values. Animation can be used for delivering simple messages at the end of a level in a game.
                    """)
                
            }
            
            Group {
                
                TextField("enter a message here", text: $phrase)
                
                
                Picker(selection: $selectedFont,
                       label: Text("Picker Name"),
                       content: {
                    
                    ForEach(CustomComposableDescriptionView.fontNames, id: \.self) { currentFont in
                        Text(currentFont)
                            .font(Font.custom(currentFont, size: 17))
                    }
                    
                })
                    .pickerStyle(MenuPickerStyle())
                    .border(Color.black)
                    .padding(.bottom, 5)
                
                Slider(value: $duration, in: 0.2...5, step: 0.1) {
                    Text("Completion amount")
                    
                }
                
                Slider(value: $selectedOffsetB, in: -100...100, step: 1) {
                    Text("end position")
                    
                }
                
                Slider(value: $textSize, in: 0...100, step: 1) {
                    Text("text size")
                    
                }
                .padding(.bottom)
                
                
                
            }
            
            Group {
                
                
                Text("Duration of animation will be \(duration)")
                
            
                
                Text("Ending offset will be \(selectedOffsetB) ")
                
                
                Text("Size of text will be \(textSize)")
                
            }
            
            List {
                NavigationLink(destination: CustomComposableViewTwo(message: phrase, font: selectedFont, desiredDuration: duration, desiredSize: textSize,  endingOffset: selectedOffsetB)) {
                    SimpleListItemView(title: "My Composable View",
                                       caption: "A brief description of my view")
                    
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

