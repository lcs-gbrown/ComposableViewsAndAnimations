//
//  CustomComposableViewTwo.swift
//  ComposableViewsAndAnimations
//
//  Created by gabi brown on 2022-04-25.
//

import SwiftUI

struct CustomComposableViewTwo: View {
    
    //MARK: Stored Properties
    let message: String
    
    let font: String
    
    let desiredDuration: Double
    
    let desiredSize: Double
    
//    let startingOffset: Double
    
    let endingOffset: Double
    
    @State private var scaleFactor: CGFloat = 1.0
    
    //1. Starting position for the text (initial state)
    @State var yOffset: Double = -200
    
    // NOTE: Here, we use a timer to initiate the state changes.
    //       In the implicit animation examples given earlier, the USER
    //       initiated state changes by, for example, clicking on the red circle.
    //
    // In half a second, make the timer fire, so the four properties above get their state changed.
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    var body: some View {
        

        let _ = print("ending Offset is: \(endingOffset)")
        let _ = print("y Offset is: \(yOffset)")

        Text("\(message)")
            .font(Font.custom(font, size: desiredSize))
            .offset(x: 0, y: CGFloat(yOffset))
            .animation(
                Animation.easeInOut(duration: desiredDuration)
            )
            .onReceive(timer) { input in
                
                yOffset = endingOffset
                
                // Stop the timer from continuing to fire
                        timer.upstream.connect().cancel()
                
            }

        
        
    }
    
}

struct CustomComposableViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableViewTwo(message: "Sad", font: "ArialHebrew", desiredDuration: 2.0, desiredSize: 50, endingOffset: 100 )
    }
}
