//
//  ContentViewModel.swift
//  RetoTC2007B
//

import SwiftUI
import PDFKit

struct Content {
    var title: String = ""
    var body: String = ""
}

class ContentViewModel: ObservableObject {
    @Published private var content = Content()

    var title: String {
        get {content.title}
        set(newTitle) {
            content.title = newTitle
        }
    }
    
    var body: String {
        get {content.body}
        set(newBody) {
            content.body = newBody
        }
    }
}

extension ContentViewModel {
    func pdfData() -> Data? {
        return PdfCreator().pdfData(title: self.title, body: self.body)
    }
    
    // No lo necesitamos
//    func clear(){
//        self.title = ""
//        self.body = ""
//    }
}
