//
//  CircularProgressView.swift
//  naeem
//
//  Created by Lina on 04/10/1443 AH.
//

import UIKit

public class CircularProgressView: UIView {

    var progressPrecntage: Float = 0
    
  // First create two layer properties
  private lazy var circleLayer : CAShapeLayer = {
    let shape = CAShapeLayer()
    shape.fillColor = UIColor.clear.cgColor
    shape.lineCap = .round
    shape.lineWidth = 10.0
      shape.strokeColor = #colorLiteral(red: 0.9688159823, green: 0.9688159823, blue: 0.9688159823, alpha: 1)
    return shape

  }()
    


   lazy var progressLayer : CAShapeLayer = {
    let progress = CAShapeLayer()
    progress.fillColor = UIColor.clear.cgColor
    progress.lineCap = .round
       progress.lineWidth = 10.0
       progress.strokeEnd = 0
       progress.strokeColor = #colorLiteral(red: 0.2862745098, green: 0.6941176471, blue: 0.7568627451, alpha: 1)
    return progress
                                            
  }()
    


  override init(frame: CGRect) {
    super.init(frame: frame)
    createCircularPath()
  }
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    createCircularPath()
  }


 private func createCircularPath() {

    updatePath()
    layer.addSublayer(circleLayer)
    layer.addSublayer(progressLayer)
  }
  public override func layoutSubviews() {
    updatePath()
    //precentage
    progressAnimation(progressPrecntage)

      
    
  }
    
 
  private func updatePath() {
    let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: 45, startAngle: -.pi / 2, endAngle: 3 * .pi / 2, clockwise: true)
      

       circleLayer.path = circularPath.cgPath
       progressLayer.path = circularPath.cgPath
  }
    
}
public extension CircularProgressView {
  func progressAnimation(_ percentage: Float) {

    let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
    circularProgressAnimation.duration = 1
    circularProgressAnimation.toValue = Float( percentage / 100 )
    circularProgressAnimation.fillMode = .forwards
    circularProgressAnimation.isRemovedOnCompletion = false
    progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
  }
    
}

