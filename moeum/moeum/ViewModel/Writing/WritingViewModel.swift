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
    
    let types = ["매수", "매도", "메모"]
    
    let recordService = RecordService()
    
    var disposeBag = DisposeBag()
    var input = Input()
    var output = Output()
    
    var record = Record()
    
    struct Input {
        let tag = PublishSubject<String>()
        let item = PublishSubject<String>()
        let typeIndex = PublishSubject<Int>()
        let typeButtonTap = PublishSubject<Void>()
        let dateButtonTap = PublishSubject<Void>()
        let date = PublishSubject<Date>()
        let price = PublishSubject<Double>()
        let count = PublishSubject<Double>()
        let memo = PublishSubject<String>()
        let noBtnFlag = PublishSubject<Bool>()
        let yesBtnFlag = PublishSubject<Bool>()
    }
    
    struct Output {
        let recordZips = BehaviorRelay(value: [])
        let itemHistoryOpen = BehaviorRelay(value: false)
        let itemHistoryRecordZips = BehaviorRelay(value: [RecordZip()])
        
        let datePickerOpen = BehaviorRelay(value: false)
        let date = BehaviorRelay(value: Date())
        let sum = PublishRelay<String>()
        
        let pageState = PublishRelay<PageState>()
    }
    
    init() {
        self.bind()
        self.output.recordZips.accept(recordService.getRecordZips())

        
//        let tmp = self.recordService.getRecordZip(type: "매수", item: "B")
//        print(tmp?.records)
//        print(tmp?.item)
    }
}
