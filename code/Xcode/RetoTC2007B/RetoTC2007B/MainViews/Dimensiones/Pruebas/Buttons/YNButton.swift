//
//  YNButton.swift
//  RetoTC2007B
//

import SwiftUI

struct YNButton: View {
    
    let id: Int
    let selectedID: Int
    let callback: (Int)->()
    
    init(id: Int, selectedID: Int, callback: @escaping (Int) -> Void) {
        self.id = id
        self.selectedID = selectedID
        self.callback = callback
    }
    
    var body: some View {
        
        Button {
            self.callback(self.id)
        } label: {
            Image(systemName: selectedID == self.id ? "checkmark.circle.fill" : "circle")
                .font(Font.system(size: 30))
                .foregroundColor(Color("Button"))
        }
    }
}

struct YNButtonGroup: View {
    
    let items: [(Double, String)]
    let question: String
    @State var selectedID: Int = -1
    let callback: (Int)->()
    
    var body: some View {
        
        HStack {
            Text(question)
                .multilineTextAlignment(.leading)
                .font(Font.custom("Apercu Light", size: 18))
                .foregroundColor(.black)
            
            Spacer()
            
            ForEach(0..<items.count, id:\.self) { index in
                YNButton(id: index, selectedID: self.selectedID, callback: self.radioGroupCallback)
            }
        }
        .padding(.horizontal)
        .frame(width: nil, height: 80)
        .background(Color.white)
        .cornerRadius(20)
        
    }
    
    func radioGroupCallback(id: Int) {
        selectedID = id
        callback(id)
    }
}
