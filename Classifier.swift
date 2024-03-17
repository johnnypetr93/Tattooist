//
//  Classifier.swift
//  Tattooist
//
//  Created by Jan Petr on 16.02.2024.
//

import CoreML
import Vision
import CoreImage

struct ArtistResult: Identifiable {
    var id = UUID()
    let artistName: String
    let confidence: Float
}

struct Classifier {
    //private(set) var results = [ArtistResult]()
    private(set) var results = [ArtistResult]()
    
    mutating func detect(ciImage: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: CoreML(configuration: MLModelConfiguration()).model)
        else {
            return
        }
        
        let request = VNCoreMLRequest(model: model)
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        
        do {
            try handler.perform([request])
        } catch {
            print("Failed to perform request: \(error)")
            return
        }
        
        guard let observations = request.results as? [VNClassificationObservation] else {
            print("Failed to obtain VNClassificationObservation")
            return
        }
        
        print("your results are \(type(of: results))")
        
        let firstThreeResults = observations.prefix(3)
                
        self.results = firstThreeResults.map { observation in
            ArtistResult(artistName: observation.identifier, confidence: observation.confidence)
        }
    }
}
