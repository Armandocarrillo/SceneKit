//
//  ViewController.swift
//  SceneKit-Primitives
//
//  Created by Armando Carrillo on 15/05/20.
//  Copyright © 2020 Armando Carrillo. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Show the world origin
        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin]
        
        
        // load Campus
        loadCampus()
    }
    
    func loadCampus (){
        //create a new scene
        let scene = SCNScene(named: "art.scnassers/campus.scn")!
        // set the scene to the view
        sceneView.scene = scene
        let node = SCNNode() // add a new node
        node.position = SCNVector3(0.0 , 0.2, 0.0 ) // add position of node
        sceneView.scene.rootNode.addChildNode(node)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
   // create a new main building in code
  /*func loadMainBuilding(){
    let node = SCNNode()
    let geometry = SCNBox(width: 3.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
    geometry.firstMaterial?.diffuse.contents = UIColor.brown
    node.geometry = geometry
    node.eulerAngles = SCNVector3(-Float.pi / 2, 0.0, 0.0 )
    let position = SCNVector3(0.0, -0.5, 0.0)
    node.position = position
    
    sceneView.scene.rootNode.addChildNode(node)
    
    }*/

 }
