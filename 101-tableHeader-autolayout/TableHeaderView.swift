//
//  TableHeaderView.swift
//  101-tableHeader-autolayout
//
//  Created by 于传峰 on 6/1/18.
//  Copyright © 2018 于传峰. All rights reserved.
//

import UIKit
import SnapKit

class TableHeaderView: UIView {

    private var topView: UIView!
    private var middleView: UIView!
    private var bottomView: UIView!
    init() {
        super.init(frame: CGRect())
        backgroundColor = .red
        setupSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews(){
        topView = UIView()
        topView.backgroundColor = YZJRandomColor()
        addSubview(topView)
        topView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(self)
            make.height.equalTo(99)
        }
        
        middleView = UIView()
        middleView.backgroundColor = YZJRandomColor()
        addSubview(middleView)
        middleView.snp.makeConstraints { (make) in
            make.top.equalTo(topView.snp.bottom)
            make.left.right.equalTo(self)
            make.height.equalTo(103)
        }
        
        bottomView = UIView()
        bottomView.backgroundColor = YZJRandomColor()
        addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.top.equalTo(middleView.snp.bottom)
            make.left.right.equalTo(self)
            make.height.equalTo(129)
        }
        
        let label = UILabel()
        label.text = "last line"
        label.sizeToFit()
        bottomView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.bottom.centerX.equalTo(bottomView)
        }
    }
    
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if superview != nil{
            snp.remakeConstraints { (make) in
                make.width.equalTo(superview!)
                make.bottom.equalTo(bottomView)
            }
            layoutIfNeeded()
        }
    }
    
    func change(){
        topView.snp.remakeConstraints { (make) in
            make.left.right.top.equalTo(self)
            make.height.equalTo(randomHeight())
        }
        middleView.snp.remakeConstraints { (make) in
            make.top.equalTo(topView.snp.bottom)
            make.left.right.equalTo(self)
            make.height.equalTo(randomHeight())
        }
        
        bottomView.snp.remakeConstraints { (make) in
            make.top.equalTo(middleView.snp.bottom)
            make.left.right.equalTo(self)
            make.height.equalTo(randomHeight())
        }
        print("frame0----: \(frame.size.height)")
        superview?.layoutIfNeeded()
        print("frame1----: \(frame.size.height)")
    }
    

    private func randomHeight() -> CGFloat{
        let random = arc4random_uniform(120) + 10
        return CGFloat(random)
    }
}
