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
    
    @State private var scaleFactor: CGFloat = 1.0
    
    var body: some View {
        Text("\(message)")
            .font(Font.custom(font, size: 17))
    }
}

struct CustomComposableViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableViewTwo(message: "Sad", font: "ArialHebrew")
    }
}
