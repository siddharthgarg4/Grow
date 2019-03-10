//
//  ArScannerViewController.swift
//  EcoHack
//
//  Created by Siddharth Garg on 2019-03-09.
//  Copyright © 2019 GreenDreamTeam. All rights reserved.
//

import UIKit
import ARKit

class ArScannerViewController: UIViewController, ARSCNViewDelegate {

    
    @IBOutlet weak var camScanner: ARSCNView!
    lazy var config = ARWorldTrackingConfiguration()
    private var companyInfo = CompanyInformationViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        camScanner.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        //config.planeDetection = .vertical
        camScanner.session.run(config)
        camScanner.delegate = self
        let popUp = SCNPlane(width: 0.1, height: 0.1)
        popUp.firstMaterial?.diffuse.contents = companyInfo.view
        let popUpNode = SCNNode(geometry: popUp)
        popUpNode.position = SCNVector3(0.1, 0.1, -0.1)
        camScanner.scene.rootNode.addChildNode(popUpNode)
    }
    
    /*func createFloorNode(anchor:ARPlaneAnchor) ->SCNNode{
        let floorNode = SCNNode(geometry: SCNPlane(width: CGFloat(anchor.extent.x), height: CGFloat(anchor.extent.z)))
        floorNode.position=SCNVector3(anchor.center.x,0,anchor.center.z)
        floorNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        floorNode.geometry?.firstMaterial?.isDoubleSided = true
        floorNode.eulerAngles = SCNVector3(Double.pi/2,0,0)
        return floorNode
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else {return} //1
        let planeNode = createFloorNode(anchor: planeAnchor) //2
        node.addChildNode(planeNode) //3
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else {return}
        node.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        let planeNode = createFloorNode(anchor: planeAnchor)
        node.addChildNode(planeNode)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        guard let _ = anchor as? ARPlaneAnchor else {return}
        node.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
    }*/

}
