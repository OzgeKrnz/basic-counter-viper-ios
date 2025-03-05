//
//  CounterInteractor.swift
//  basic-counter-viper
//
//  Created by özge kurnaz on 3.03.2025.
//

protocol CounterInteractorProtocol: AnyObject{
    func incrementCount()
    func getCurrentCount()
}

protocol CounterInteractorOutputProtocol: AnyObject{
    func didUpdateCount(_ count: Int)
}

import Foundation

class CounterInteractor: CounterInteractorProtocol{
    weak var presenter: CounterInteractorOutputProtocol?
    private var counter = CounterEntity()
    
    
    func incrementCount() {
        counter.count += 1
        presenter?.didUpdateCount(counter.count)
    }
    
    func getCurrentCount() {
        presenter?.didUpdateCount(counter.count)
    }
}


// İş mantıgı burda yönetilir: Sayacı arttırma işlemi
// yeni sayaç değeri presentera bildirilir.
