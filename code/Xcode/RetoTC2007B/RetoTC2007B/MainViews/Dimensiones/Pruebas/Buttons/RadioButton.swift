//
//  RadioButton.swift
//  RetoTC2007B
//

import SwiftUI

struct RadioButton: View {
    
    let id: Int
    let answer: String
    let selectedID: Int
    let callback: (Int)->()
    
    init(id: Int, answer: String/*, weight: Double*/, selectedID: Int, callback: @escaping (Int) -> Void) {
        self.id = id
        self.answer = answer
        self.selectedID = selectedID
        self.callback = callback
    }
    
    var body: some View {
        
        HStack {
            
            Button {
                self.callback(self.id)
            } label: {
                Image(systemName: selectedID == self.id ? "checkmark.circle.fill" : "circle")
                    .font(Font.system(size: 30))
                    .foregroundColor(Color("Button"))
                
            }
            
            Text(answer)
                .multilineTextAlignment(.leading)
                .font(Font.custom("Apercu Light", size: 18))
                .foregroundColor(.black)
            
            Spacer()
            
        }
        .padding(.horizontal)
        .frame(width: nil, height: 80)
        .background(Color.white)
        .cornerRadius(20)
        
    }
}


struct RadioButtonGroup: View {
    
    let items: [(Double, String)]
    @State var selectedID: Int = -1
    let callback: (Int)->()
    
    var body: some View {
        
        VStack {
            ForEach(0..<items.count, id:\.self) { index in
                RadioButton(id: index, answer: items[index].1, selectedID: self.selectedID, callback: self.radioGroupCallback)
            }
        }
        
    }
    
    func radioGroupCallback(id: Int) {
        selectedID = id
        callback(id)
    }
}
