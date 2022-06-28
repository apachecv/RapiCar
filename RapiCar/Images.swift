//
//  Images.swift
//  RapiCar
//
//  Created by Nttdata on 28/06/22.
//

import SwiftUI

struct Images: View {
    var body: some View {
        Image("Image1").resizable().padding(50).frame(width: 300, height: 300)
        
    }
}

struct Images_Previews: PreviewProvider {
    static var previews: some View {
        Images()
    }
}
