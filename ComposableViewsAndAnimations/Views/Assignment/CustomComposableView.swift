//
//  EncouragementView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit

struct CustomComposableView: View {
    
    //MARK: Stored properties
    
    let desiredDuration: Double
    
    //Control the horizontal offset
    @State private var offset = 0.0
    
    //Control the rotation angle
    @State var currentRotationAngle = Angle.degrees(0)
    
    //MARK: Computed properties
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50, height: 50)
               
            
            Text("Ok")
                .foregroundColor(.white)
        }
        .rotationEffect(currentRotationAngle, anchor: .center)
        .offset(x: offset, y: 0)
        .animation(
            Animation.easeInOut(duration: 2.0)
        )
        .onTapGesture {
            //Move the circle to the right
            offset = 100.0
            
        // rotate a full revolution
            currentRotationAngle = .degrees(360)
        }
    }
    
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView(desiredDuration: 2.0)
    }
}
