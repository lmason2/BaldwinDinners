//
//  StepRowView.swift
//  BaldwinDinners
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct StepRowView: View {
    let step: Instructions
    @State var isOn : Bool
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text(step.step)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
        } //: TOGGLE
        .toggleStyle(CheckboxStyle())
    }
}
