//
//  PdfCreator.swift
//  RetoTC2007B
//

import Foundation
import PDFKit

class PdfCreator: NSObject {
    private var pageRect: CGRect // Location and dimention of the PDF
    private var renderer: UIGraphicsPDFRenderer? // A graphics renderer for creating PDFs
    
    /* Sizes of an A4 sheet of paper
     W: 8.5 inches * 72 DPI = 612 points
     H: 11 inches * 72 DPI = 792 points
     A4 = [W x H] 595 x 842 points
     */
    
    // We initialize and give pageRect its dimentions
    init(pageRect: CGRect = CGRect(x: 0, y: 0, width: (8.5 * 72.0), height: (11 * 72.0))) {
        
        let format = UIGraphicsPDFRendererFormat() // A set of drawing attributes that represents the configuration of a PDF renderer context
        let metaData = [kCGPDFContextTitle: "Resultados de Pruebas Recientes", kCGPDFContextAuthor: "AbuelitosABP"]
        
        format.documentInfo = metaData as [String: Any]
        
        self.pageRect = pageRect
        self.renderer = UIGraphicsPDFRenderer(bounds: self.pageRect, format: format)
        
        super.init()
    }
}

extension PdfCreator {
    // Function to add a title to the PDF
    private func addTitle(title: String) {
        let textRect = CGRect(x: 20, y: 20, width: pageRect.width - 40, height: pageRect.height - 40)
        
        title.draw(in: textRect, withAttributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)])
    }
    
    // Function to add a body to the PDF
    private func addBody(body: String) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.foregroundColor: UIColor.gray
        ]
        
        let bodyRect = CGRect(x: 20, y: 20, width: pageRect.width - 40, height: pageRect.height - 80)
        
        body.draw(in: bodyRect, withAttributes: attributes)
    }
}

extension PdfCreator {
    func pdfData(title: String, body: String) -> Data? {
        if let renderer = self.renderer {
            
            let data = renderer.pdfData { ctx in
                ctx.beginPage()
                addTitle(title: title)
                addBody(body: body)
            }
            
            return data
        }
        
        return nil
    }
}
