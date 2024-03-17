//
//  ContentView.swift
//  Tattooist
//
//  Created by Jan Petr on 16.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State private var classifier = Classifier()
    
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @State private var results = [ArtistResult]()
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "photo")
                    .onTapGesture {
                        isPresenting = true
                        sourceType = .photoLibrary
                    }
                Image(systemName: "camera")
                    .onTapGesture {
                        isPresenting = true
                        sourceType = .camera
                    }
            }
            .font(.largeTitle)
            
            
            Rectangle()
                .strokeBorder()
                .foregroundStyle(Color.yellow)
                .overlay(
                    Group {
                        if uiImage != nil {
                            Image(uiImage: uiImage!)
                                .resizable()
                                .scaledToFit()
                        }
                    }
                )
            Button(action: {
                if uiImage != nil {
                    guard let ciImage = CIImage(image: uiImage!) else {
                        print("cannot convert uiimage to ciimage")
                        return
                    }
                    classifier.detect(ciImage: ciImage)
                    
                    results = classifier.results
                    
                }
            }) {
                Image(systemName: "bolt.fill")
                    .foregroundColor(.red)
                    .font(.title)
            }
            ForEach(results, id: \.id) { result in
                Text("Artist: \(result.artistName): \(confidenceToPercent(confidence: result.confidence), specifier: "%.2f") %")
            }
        }
        .sheet(isPresented: $isPresenting){
            ImagePicker(uiImage: $uiImage, isPresenting: $isPresenting, sourceType: $sourceType)
        }
    }
    
    func confidenceToPercent(confidence: Float) -> Float {
        let shifted = confidence * 100
        let rounded = round(shifted * 100) / 100
        return rounded
    }
}

#Preview {
    ContentView()
}
