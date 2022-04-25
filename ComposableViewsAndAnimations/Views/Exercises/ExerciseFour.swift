//
//  ExerciseOneView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit

struct ExerciseFourView: View {
    
    // MARK: Stored properties
    
    // Controls whether this view is showing or not
    @Binding var showThisView: Bool
        
    // Whether to apply the animation
    @State private var useAnimation = false
    
    //Control the scale foctor
    @State private var scaleFactor: CGFloat = 1.0

    
    @State private var hue: Color = .red
    
    // MARK: Computed properties

    var body: some View {
        
        NavigationView {
            
            VStack {

                Circle()
                    .scaleEffect(2.0)
                    .foregroundColor(hue)
                    .animation(
                    Animation
                        .easeInOut(duration: 2.0)
                        .repeatForever(autoreverses: true)
                    )
                    .onTapGesture {
                        //Change the scale factor
                        scaleFactor = 2.0
                        
                        hue = Color(hue: Double.random(in: 1...360) / 360.0,
                                    saturation: 0.8,
                                    brightness: 0.8)
                       
                        
                    }
                
            }
            .navigationTitle("Exercise 1")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        hideView()
                    }
                }
            }

        }
        
    }
    
    // MARK: Functions
    
    // Makes this view go away
    func hideView() {
        showThisView = false
    }
    
}

struct ExerciseFourView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseFourView(showThisView: .constant(true))
    }
}
