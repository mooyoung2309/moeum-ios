//
//  CalendarBottomSheet.swift
//  moeum
//
//  Created by 송영모 on 2022/04/11.
//

import UIKit

class CalendarBottomSheet: UIView {
    var contentView = UIView()
    var topDividerView = UIView()
    var titleLabel = UILabel()
    var hideButton = UIButton()
    
    var recordFixedLabel = RecordFixedLabel()
    var recordStackView = UIStackView()
        .then {
            $0.axis = .vertical
            $0.spacing = 25
        }
    
    var date = Date()
    let weekOfDays = ["토", "일", "월", "화", "수", "목", "금"]
    var records: [Record] = []
    let dateFormatter = DateFormatter()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setView()
    }
    
    func update(date: Date, records: [Record]) {
        self.date = date
        self.records = records
        
        recordStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for record in records {
            let recordLabel = RecordLabel(record: record)
            recordStackView.addArrangedSubview(recordLabel)
        }
        
        dateFormatter.dateFormat = "M.d"
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        titleLabel.text = dateFormatter.string(from: date) + " (" + weekOfDays[Calendar.current.dateComponents([.weekday], from: date).weekday! - 1] + ")"
    }
    
    func setView() {
        addSubview(contentView)
        contentView.addSubview(topDividerView)
        contentView.addSubview(hideButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(recordFixedLabel)
        contentView.addSubview(recordStackView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        topDividerView.translatesAutoresizingMaskIntoConstraints = false
        hideButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        recordFixedLabel.translatesAutoresizingMaskIntoConstraints = false
        recordStackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.backgroundColor = .systemGray6
        backgroundColor = .systemGray6
        topDividerView.backgroundColor = .systemGray
        hideButton.tintColor = .systemGray3
        hideButton.setBackgroundImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
        titleLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            topDividerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            topDividerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            topDividerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            topDividerView.heightAnchor.constraint(equalToConstant: 0.4),
            
            hideButton.topAnchor.constraint(equalTo: topDividerView.bottomAnchor),
            hideButton.widthAnchor.constraint(equalToConstant: 45),
            hideButton.heightAnchor.constraint(equalToConstant: 25),
            hideButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: topDividerView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            recordFixedLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            recordFixedLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            recordFixedLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            recordFixedLabel.heightAnchor.constraint(equalToConstant: 20),
            
            recordStackView.topAnchor.constraint(equalTo: recordFixedLabel.bottomAnchor),
            recordStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            recordStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            recordStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
