//
//  WebDiagrammView.swift
//  Expert Assessment
//
//  Created by verofieiev on 11/1/18.
//  Copyright © 2018 Vladyslav Yerofieiev. All rights reserved.
//

import UIKit

class WebDiagrammView: UIView {
    private let triangles: [Triangle]
    private let name: String
    private let square: Float
    
    var polygonColor = UIColor.red {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    init(triangles: [Triangle], square: Float, name: String) {
        self.triangles = triangles
        self.name = name
        self.square = square
        super.init(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let coof = (rect.size.width-20) / (100.0 * 2)
        let textFontAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),
            NSAttributedString.Key.foregroundColor: UIColor.black,
            ]
        let mid = CGPoint(x: rect.midX, y:  rect.midY + 10)
        ("\(name) S=\(square) ум.од" as NSString).draw(in: CGRect(x: 20, y: 0, width: rect.size.width-20, height: 20), withAttributes: textFontAttributes)
        UIColor.lightGray.setStroke()
        for i in 0...10 {
            let fi = CGFloat(i)
            let radius = fi*10.0*coof
            
            let oval = UIBezierPath(ovalIn: CGRect(x: mid.x-radius,
                                                   y: mid.y-radius,
                                                   width: radius*2,
                                                   height: radius*2))
            oval.stroke()
        }
        UIColor.gray.setStroke()
        UIColor.gray.setFill()
        
        let path = UIBezierPath()
        path.lineWidth = 2
        triangles.enumerated().forEach { (offset, element) in
            let point = CGPoint(x: mid.x + CGFloat(element.a) * coof, y: mid.y + CGFloat(element.b) * coof)
            if offset == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }

            let oval = UIBezierPath(ovalIn: CGRect(x: point.x - 2,
                                                   y: point.y - 2,
                                                   width: 4,
                                                   height: 4))
            oval.fill()
            oval.stroke()
            ("\(offset+1)" as NSString).draw(at: point, withAttributes: textFontAttributes)
            
            let linePath = UIBezierPath()
            linePath.move(to: mid)
            linePath.addLine(to: point)
            linePath.stroke()
        }
        polygonColor.setStroke()
        polygonColor.withAlphaComponent(0.5).setFill()
        path.close()
        path.stroke()
        path.fill()
    }
}
