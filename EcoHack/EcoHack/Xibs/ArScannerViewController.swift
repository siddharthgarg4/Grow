//
//  ArScannerViewController.swift
//  EcoHack
//
//  Created by Siddharth Garg on 2019-03-09.
//  Copyright © 2019 GreenDreamTeam. All rights reserved.
//

import UIKit
import ARKit
import CoreML
import Vision
import ImageIO
import Foundation

class ArScannerViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet weak var camScanner: ARSCNView!
    
    lazy var config = ARWorldTrackingConfiguration()
    private var companyInfo = CompanyInformationViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true, block: { timer in
            let image = self.camScanner.snapshot()
            self.updateClassifications(for: image)
        })
        
        camScanner.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        //config.planeDetection = .vertical
        camScanner.session.run(config)
        camScanner.delegate = self
//        let popUp = SCNPlane(width: 0.1, height: 0.1)
//        popUp.firstMaterial?.diffuse.contents = companyInfo.view
//        let popUpNode = SCNNode(geometry: popUp)
//        popUpNode.position = SCNVector3(0.1, 0.1, -0.1)
//        camScanner.scene.rootNode.addChildNode(popUpNode)
    
    }
    
    
    /// - Tag: MLModelSetup
    lazy var classificationRequest: VNCoreMLRequest = {
        do {
            /*
             Use the Swift class `MobileNet` Core ML generates from the model.
             To use a different Core ML classifier model, add it to the project
             and replace `MobileNet` with that model's generated Swift class.
             */
            let model = try VNCoreMLModel(for: LogoClassifierV2().model)
            
            let request = VNCoreMLRequest(model: model, completionHandler: { [weak self] request, error in
                self?.processClassifications(for: request, error: error)
            })
            request.imageCropAndScaleOption = .centerCrop
            return request
        } catch {
            fatalError("Failed to load Vision ML model: \(error)")
        }
    }()
    
    /// - Tag: PerformRequests
    func updateClassifications(for image: UIImage) {
        print("Classifying...")
        
        let orientation = CGImagePropertyOrientation(image.imageOrientation)
        guard let ciImage = CIImage(image: image) else { fatalError("Unable to create \(CIImage.self) from \(image).") }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation)
            do {
                try handler.perform([self.classificationRequest])
            } catch {
                /*
                 This handler catches general image processing errors. The `classificationRequest`'s
                 completion handler `processClassifications(_:error:)` catches errors specific
                 to processing that request.
                 */
                print("Failed to perform classification.\n\(error.localizedDescription)")
            }
        }
    }
    
    /// Updates the UI with the results of the classification.
    /// - Tag: ProcessClassifications
    func processClassifications(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async {
            guard let results = request.results else {
                print("Unable to classify image.\n\(error!.localizedDescription)")
                return
            }
            // The `results` will always be `VNClassificationObservation`s, as specified by the Core ML model in this project.
            let classifications = results as! [VNClassificationObservation]
            print("F")
            if classifications.isEmpty {
                print("Nothing recognized.")
            } else {
                // Display top classifications ranked by confidence in the UI.
                let topClassifications = classifications.prefix(1)
                let descriptions = topClassifications.map { classification in
                    // Formats the classification for display; e.g. "(0.37) cliff, drop, drop-off".
                    return String(format: "%.2f)%@", classification.confidence, classification.identifier)
                }
                print("Classification:\n" + descriptions.joined(separator: "\n"))
                
                let confidence = descriptions[0].prefix(3)
                let title = descriptions[0].dropFirst(5)

                let data = (String(confidence), String(title))
                self.determineLogo(company: data)
            }
        }
    }
    func determineLogo (company: (String, String)) {
        print("data: ", company)
        if(Double(company.0)! > 0.85 && company.1 != "logo_none") {
            
            let popUp = SCNPlane(width: 0.1, height: 0.1)
            popUp.firstMaterial?.diffuse.contents = companyInfo.view
            let popUpNode = SCNNode(geometry: popUp)
            popUpNode.position = SCNVector3(0.1, 0.1, -0.1)
            camScanner.scene.rootNode.addChildNode(popUpNode)
            
            
            companyInfo._companyLabel = company.1
        }
    }
}
