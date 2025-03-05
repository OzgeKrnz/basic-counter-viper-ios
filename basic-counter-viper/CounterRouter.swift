//
//  CounterRouter.swift
//  basic-counter-viper
//
//  Created by özge kurnaz on 3.03.2025.
//

import UIKit

protocol CounterRouterProtocol: AnyObject{
    static func createModule()->CounterViewController
}

class CounterRouter: CounterRouterProtocol{
    static func createModule() -> CounterViewController {
        let view = CounterViewController()
        let presenter = CounterPresenter()
        let interactor = CounterInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}

//Viper bileşenleri birbirine baglıyoeuz
// Bu metod appdelegate icinde cagrılacak.
