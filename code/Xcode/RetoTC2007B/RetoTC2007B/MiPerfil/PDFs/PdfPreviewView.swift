//
//  PdfPreviewView.swift
//  RetoTC2007B
//

import SwiftUI

struct PdfPreviewView: View {
    
    @EnvironmentObject private var contentViewModel: ContentViewModel
    
    @State private var showShareSheet: Bool = false
    
    var body: some View {
        ZStack {
            
            Color("Background")
                .ignoresSafeArea()
            
            VStack {
                PdfViewUI(data: contentViewModel.pdfData())
                shareButton()
                Spacer()
            }
            .navigationTitle(Text("Tu PDF"))
                    .navigationBarTitleDisplayMode(.inline)
                    .sheet(isPresented: $showShareSheet, content: {
                        if let data = contentViewModel.pdfData() {
                            ShareView(activityItems: [data])
                        }
                })
        }
    }
}

struct PdfPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PdfPreviewView()
    }
}

extension PdfPreviewView {
    private func shareButton() -> some View {
    
        Button(action: {
            self.showShareSheet.toggle()
        }, label: {
            Text("Share")
            .padding(10)
            .frame(width: 100)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
        })
    }
}
