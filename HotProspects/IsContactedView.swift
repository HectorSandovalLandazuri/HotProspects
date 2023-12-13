//
//  IsContactedView.swift
//  HotProspects
//
//  Created by Héctor Manuel Sandoval Landázuri on 13/12/23.
//

import SwiftUI

struct IsContactedView: View {
    var isContacted: Bool
    var body: some View {
        Image(systemName: isContacted ? "person.crop.circle.badge.checkmark" : "person.crop.circle.badge.minus")
            .font(.system(size: 29))
            .foregroundColor(isContacted ? .green : .red)
    }
}

#Preview {
    IsContactedView(isContacted:false)
}
