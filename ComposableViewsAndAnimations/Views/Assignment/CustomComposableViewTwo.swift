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
    
    @State private var scaleFactor: CGFloat = 1.0
    
    
    // NOTE: Here, we use a timer to initiate the state changes.
    //       In the implicit animation examples given earlier, the USER
    //       initiated state changes by, for example, clicking on the red circle.
    //
    // In half a second, make the timer fire, so the four properties above get their state changed.
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    var body: some View {
        
        Text("\(message)")
            .font(Font.custom(font, size: 50))
            .offset(x: 0, y: -300)
            .animation(
                Animation.easeInOut(duration: desiredDuration)
            )
            .onReceive(timer) { input in
                // Stop the timer from continuing to fire
                        timer.upstream.connect().cancel() }
        
        
    }
    
}

struct CustomComposableViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableViewTwo(message: "Sad", font: "ArialHebrew", desiredDuration: 2.0)
    }
}
