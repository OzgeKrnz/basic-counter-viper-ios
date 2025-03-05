//
//  CounterViewController.swift
//  basic-counter-viper
//
//  Created by özge kurnaz on 3.03.2025.
//

import UIKit

protocol CounterViewProtocol: AnyObject{
    func showCount(_ countText: String)
}

class CounterViewController: UIViewController , CounterViewProtocol{

    var presenter: CounterPresenterProtocol?
    
    private let countLabel : UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 30)
        return lbl
    }()
    
    private let incrementButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Artır", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
            
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        countLabel.frame = CGRect(x: 50, y: 200, width: 300, height: 50)
        incrementButton.frame = CGRect(x: 100, y: 300, width: 200, height: 50)
        incrementButton.addTarget(self, action: #selector(didTapIncrement), for: .touchUpInside)

        view.addSubview(countLabel)
        view.addSubview(incrementButton)
    }
    
    @objc private func didTapIncrement() {
          presenter?.increaseCount()
      }

    
    func showCount(_ countText: String) {
        countLabel.text = countText
    }
    



}

//View Presenterdan gelen veriyi gçsterir
//Butona basıncaa increaseCount cagrılır.


