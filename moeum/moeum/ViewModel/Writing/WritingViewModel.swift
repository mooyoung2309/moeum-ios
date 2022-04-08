//
//  WritingViewModel.swift
//  moeum
//
//  Created by 송영모 on 2022/04/06.
//

import Foundation
import RxSwift
import RxCocoa

class WritingViewModel: ViewModel {
    
    let recordService = RecordService()
    
    var disposeBag = DisposeBag()
    var input = Input()
    var output = Output()
    
    var record = Record()
    
    struct Input {
        let tagName = PublishSubject<String>()
        let itemName = PublishSubject<String>()
        let isClickedBuyDateButton = BehaviorRelay(value: false)
        let isClickedSellDateButton = BehaviorRelay(value: false)
        let date = PublishSubject<Date>()
        let buyPrice = PublishSubject<String>()
        let sellPrice = PublishSubject<String>()
        let buyCount = PublishSubject<String>()
        let sellCount = PublishSubject<String>()
        let memo = PublishSubject<String>()
        let noBtnFlag = PublishSubject<Bool>()
        let yesBtnFlag = PublishSubject<Bool>()
    }
    
    struct Output {
        let datePickerOpen = PublishRelay<Int>()
        let buyDate = BehaviorRelay(value: Date(timeIntervalSince1970: 0))
        let sellDate = BehaviorRelay(value: Date(timeIntervalSince1970: 0))
        let buySum = PublishRelay<String>()
        let sellSum = PublishRelay<String>()
        let income = PublishRelay<Double>()
        let precent = PublishRelay<Double>()
        let pageState = PublishRelay<PageState>()
    }
    
    init() {
        self.bind()
    }
}
