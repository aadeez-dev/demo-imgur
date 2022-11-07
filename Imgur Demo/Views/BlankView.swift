//
//  BlankView.swift
//  Imgur Demo
//
//  Created by Aadeez Shaikh on 07/11/22.
//

import SwiftUI

struct BlankView: View {
    var body: some View {
        Text("Please use the search bar to find photos.")
            .foregroundColor(.gray)
            .padding(.all)
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView()
    }
}
