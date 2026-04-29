//
//  PdfViewUI.swift
//  RetoTC2007B
//


import SwiftUI
import PDFKit

struct PdfViewUI: UIViewRepresentable {
    
    private var data: Data?
    
    private let autoScales: Bool
    
    init(data: Data?, autoScales: Bool = true) {
        self.data = data
        self.autoScales = autoScales
    }
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        
        pdfView.autoScales = self.autoScales
        
        if let data = self.data {
            pdfView.document = PDFDocument(data: data)
        }
        
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: Context) {
            // Empty
    }
}

struct ShareView: UIViewControllerRepresentable {
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil

    func makeUIViewController(context: UIViewControllerRepresentableContext<ShareView>) ->
        UIActivityViewController {
        return UIActivityViewController(activityItems: activityItems,
               applicationActivities: applicationActivities)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController,
               context: UIViewControllerRepresentableContext<ShareView>) {
        // empty
    }
}
