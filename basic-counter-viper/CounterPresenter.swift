//
//  CounterPresenter.swift
//  basic-counter-viper
//
//  Created by özge kurnaz on 3.03.2025.
//

import Foundation
protocol CounterPresenterProtocol{
    func increaseCount()
    func viewDidLoad()
}


class CounterPresenter: CounterPresenterProtocol{
    weak var view: CounterViewProtocol?
    var interactor: CounterInteractor?
    
    
    func viewDidLoad() {
        interactor?.getCurrentCount()
    }
    
    func increaseCount() {
        interactor?.incrementCount()
    }
}

extension CounterPresenter: CounterInteractorOutputProtocol{
    func didUpdateCount(_ count: Int) {
        view?.showCount("\(count)")
    }
}


// Presenter, View ile Interacor arasında köprü görevi görür.
// increaseCount cagrıldıgında ınteractora gider ve sayısı artırır.
// didUpdateCount metodu güncellenmii sayıyı viewa iletir.
