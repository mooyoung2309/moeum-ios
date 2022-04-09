//
//  CalendarVC+Bind.swift
//  moeum
//
//  Created by 송영모 on 2022/04/07.
//

extension CalendarViewController {
    func setBind() {
        writingButton.rx.tap
            .bind { [weak self] in self?.goToWritingVC() }
            .disposed(by: disposeBag)
        
        
        headerView.pickerButton.rx.tap
            .subscribe(onNext: { [weak self] _ in
                let bool = !(self?.viewModel.input.isClickedDatePickerButton.value ?? false)
                self?.viewModel.input.isClickedDatePickerButton.accept(bool)
            })
            .disposed(by: disposeBag)
        
        headerView.datePicker.rx.date
            .bind(to: viewModel.input.nowDate)
            .disposed(by: disposeBag)
        
        viewModel.output.datePickerOpen
            .subscribe(onNext: { [weak self] in
                if $0 {
                    self?.headerView.showDatePicker()
                } else {
                    self?.headerView.hideDatePicker()
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.output.dateLabel
            .subscribe(onNext: {[weak self] in
                self?.headerView.monthLabel.text = $0
            })
            .disposed(by: disposeBag)
        
        viewModel.output.cellDatas
            .bind(to : calendarView.rx.items(cellIdentifier: CalendarViewCell.identifier, cellType: CalendarViewCell.self)) {
                index, cellData, cell in 
                cell.update(date: cellData.0, records: cellData.1)
            }
            .disposed(by: disposeBag)
    }
}
