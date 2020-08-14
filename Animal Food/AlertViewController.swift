//
//  AlertViewController.swift
//  Animal Food
//
//  Created by Idan Moshe on 03/08/2020.
//  Copyright © 2020 Idan Moshe. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = UIScreen.main.bounds
        self.modalPresentationStyle = .overFullScreen
        self.modalTransitionStyle = .crossDissolve
        
        let imageView = UIImageView(image: UIImage(named: "check"))
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        self.view.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        self.view.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.dismiss(animated: true, completion: nil)
        }
    }

}
