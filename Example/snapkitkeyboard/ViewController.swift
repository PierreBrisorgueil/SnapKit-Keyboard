//
//  ViewController.swift
//  snapkitkeyboard
//
//  Created by Szymon Maślanka on 03/01/2017.
//  Copyright © 2017 Szymon Maślanka. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let topViewReplacement: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    let topMiddleView: UITextField = {
        let view = UITextField()
        view.backgroundColor = .green
        return view
    }()
    
    let bottomMiddleView: UITextField = {
        let view = UITextField()
        view.backgroundColor = .gray
        return view
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        setupSubviews()
        setupObservers()
        setupConstraints()
    }
    
    private func setupSubviews(){
        view.addSubview(topView)
        view.addSubview(topViewReplacement)
        view.addSubview(topMiddleView)
        view.addSubview(bottomMiddleView)
        view.addSubview(bottomView)
    }
    
    private func setupObservers(){
        view.registerAutomaticKeyboardConstraints()
    }
    
    private func setupConstraints(){
        topView.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(100)
            make.top.equalTo(view.snp.top).auto(keyboard: false, in: view)
        }
        
        topView.snp.prepareConstraints { (make) in
            make.bottom.equalTo(view.snp.top).auto(keyboard: true, in: view)
        }
        
        topViewReplacement.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(100)
            make.bottom.equalTo(view.snp.top).auto(keyboard: false, in: view)
        }
        
        topViewReplacement.snp.prepareConstraints { (make) in
            make.top.equalTo(view.snp.top).auto(keyboard: true, in: view)
        }
        
        topMiddleView.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left).offset(20)
            make.height.equalTo(44)
            make.centerX.equalTo(view.snp.centerX).auto(.regular, in: view)
            make.right.equalTo(view.snp.right).offset(-20).auto(.regular, in: view)
            make.right.equalTo(view.snp.centerX).offset(-20).auto(.compact, keyboard: false, in: view)
            make.centerY.equalTo(view.snp.centerY).offset(-44).auto(.compact, keyboard: false, in: view)
            make.centerY.equalTo(view.snp.centerY).auto(.compact, keyboard: false, in: view)
        }
        
        topMiddleView.snp.prepareConstraints { (make) in
            make.centerY.equalTo(view.snp.centerY).offset(-144).auto(.regular, keyboard: true, in: view)
            make.right.equalTo(view.snp.centerX).offset(-64).auto(.compact, keyboard: true, in: view)
            make.centerY.equalTo(view.snp.centerY).offset(-44).auto(.compact, keyboard: true, in: view)
        }
        
        bottomMiddleView.snp.makeConstraints { (make) in
            make.height.equalTo(44)
            make.top.equalTo(topMiddleView.snp.bottom).offset(44)
            make.left.equalTo(view.snp.left).offset(20).auto(.regular, in: view)
            make.centerX.equalTo(view.snp.centerX).auto(.regular, in: view)
            make.right.equalTo(view.snp.right).offset(-20).auto(.regular, in: view)
            make.right.equalTo(view.snp.right).offset(-20).auto(.compact, keyboard: false, in: view)
            make.left.equalTo(view.snp.centerX).offset(20).auto(.compact, keyboard: false, in: view)
            make.centerY.equalTo(topMiddleView.snp.centerY).auto(.compact, in: view)
        }
        
        bottomMiddleView.snp.prepareConstraints { (make) in
            make.left.equalTo(topMiddleView.snp.right).offset(16).auto(.compact, keyboard: true, in: view)
        }
        
        bottomView.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(55)
            make.bottom.equalTo(view.snp.bottom).offset(-44).auto(keyboard: false, in: view)
            make.centerX.equalTo(view.snp.centerX).auto(.regular, in: view)
            make.centerX.equalTo(view.snp.centerX).auto(.compact, keyboard: false, in: view)
        }
        
        bottomView.snp.prepareConstraints { (make) in
            make.top.equalTo(bottomMiddleView.snp.bottom).offset(20).auto(.regular, keyboard: true, in: view)
            make.centerY.equalTo(bottomMiddleView.snp.centerY).auto(.compact, keyboard: true, in: view)
            make.left.equalTo(bottomMiddleView.snp.right).offset(8).auto(.compact, keyboard: true, in: view)
            make.right.equalTo(view.snp.right).offset(-8).auto(.compact, keyboard: true, in: view)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

