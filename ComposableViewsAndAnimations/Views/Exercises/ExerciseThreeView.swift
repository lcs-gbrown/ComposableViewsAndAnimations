//
//  ExerciseThreeView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit

struct ExerciseThreeView: View {
    
    // MARK: Stored properties
    
    // Controls whether this view is showing or not
    @Binding var showThisView: Bool
        
    // Controls what typeface the text is shown in
    @State private var typeFace: String = "Helvetica-Neue"

    // Whether to apply the animation
    @State private var useAnimation = false
    
    // How much to rotate the text
    @State private var rotationAmount = 0.0
    
    @State private var shouldAnimate = false

    // MARK: Computed properties
        
        var body: some View {
            Rectangle()
                .fill(Color.red)
                .frame(width: 30, height: 30)
                .overlay(
                    ZStack {
                       Rectangle()
                            .stroke(Color.red, lineWidth: 100)
                            .scaleEffect(shouldAnimate ? 1 : 0)
                        Rectangle()
                            .stroke(Color.orange, lineWidth: 100)
                            .scaleEffect(shouldAnimate ? 1.5 : 0)
                        Rectangle()
                            .stroke(Color.orange, lineWidth: 100)
                            .scaleEffect(shouldAnimate ? 1.5 : 0)
                    }
                    .opacity(shouldAnimate ? 0.0 : 0.2)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false))
            )
            .onAppear {
                self.shouldAnimate = true
            }
        }
    
    // List all fonts available
    // NOTE: This is a very useful gist...
    //       https://gist.github.com/kristopherjohnson/c825cb97b1ad1fe0bc13d709986d0763
    private static let fontNames: [String] = {
        var names: [String] = []
        for familyName in UIFont.familyNames {
            names.append(contentsOf: UIFont.fontNames(forFamilyName: familyName))
        }
        return names.sorted()
    }()
    
    // MARK: Functions
    
    // Makes this view go away
    func hideView() {
        showThisView = false
    }
        
    }


struct ExerciseThreeView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseThreeView(showThisView: .constant(true))
    }
}
