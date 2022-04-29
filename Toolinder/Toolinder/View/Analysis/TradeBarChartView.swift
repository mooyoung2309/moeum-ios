//
//  TradeBarChartView.swift
//  Toolinder
//
//  Created by 송영모 on 2022/04/29.
//

import UIKit
import Then

class TradeBarChartView: UIView {

    var titleLabel = UILabel().then {
        $0.text = "타이틀"
        $0.font = Const.Font.headline
        $0.textColor = Const.Color.black
    }

    var typeSegmentControl = UISegmentedControl(items: ["전체", "매수", "매도"])
    var periodSegmentControl = UISegmentedControl(items: ["일", "주", "월"])
    var tradeBarViews: [TradeBarView] = []
    
    var tradeChartZip: TradeChartZip!
    var typeOption = 0
    var periodOption = 0
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    func setView() {
        addSubview(titleLabel)
        addSubview(typeSegmentControl)
        addSubview(periodSegmentControl)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        typeSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        periodSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        
        typeSegmentControl.selectedSegmentIndex = 0
        periodSegmentControl.selectedSegmentIndex = 0
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            typeSegmentControl.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            typeSegmentControl.leadingAnchor.constraint(equalTo: leadingAnchor),
            typeSegmentControl.widthAnchor.constraint(equalToConstant: 130),
            
            periodSegmentControl.topAnchor.constraint(equalTo: typeSegmentControl.topAnchor),
            periodSegmentControl.trailingAnchor.constraint(equalTo: trailingAnchor),
            periodSegmentControl.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
}

extension TradeBarChartView {
    func setTradeChartZip(tradeChartZip: TradeChartZip) {
        self.tradeChartZip = tradeChartZip
        updateTradeChartZip(tradeChartZip: self.tradeChartZip)
    }
    
    func setTypeOption(option: Int) {
        if self.typeOption == option { return }
        self.typeOption = option
        updateTypeOption(option: self.typeOption)
    }
    
    func setPeriodOption(option: Int) {
        if self.periodOption == option { return }
        self.periodOption = option
        updatePeriodOption(option: self.periodOption)
    }
    
    func updateTradeChartZip(tradeChartZip: TradeChartZip) {
        refresh()
        for tradeChart in tradeChartZip.TradeCharts {
            tradeBarViews.append(TradeBarView(tradeChart: tradeChart))
        }
        
        for (i, tradeBarView) in tradeBarViews.enumerated() {
            addSubview(tradeBarView)
            
            tradeBarView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                tradeBarView.topAnchor.constraint(equalTo: typeSegmentControl.bottomAnchor, constant: 10),
                tradeBarView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: CGFloat(1) / CGFloat(7)),
                tradeBarView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
            
            if tradeBarView == tradeBarViews.first {
                NSLayoutConstraint.activate([
                    tradeBarView.leadingAnchor.constraint(equalTo: leadingAnchor),
                ])
            } else if tradeBarView == tradeBarViews.last {
                NSLayoutConstraint.activate([
                    tradeBarView.trailingAnchor.constraint(equalTo: trailingAnchor),
                ])
            } else {
                NSLayoutConstraint.activate([
                    tradeBarView.leadingAnchor.constraint(equalTo: tradeBarViews[i-1].trailingAnchor),
                ])
            }
        }
    }
    
    func updateTypeOption(option: Int) {
        if option == 0 {
            tradeBarViews.forEach({ $0.showAllBarView() })
        } else if option == 1 {
            tradeBarViews.forEach({ $0.showBuyBarView() })
        } else {
            tradeBarViews.forEach({ $0.showSellBarView() })
        }
    }
    
    func updatePeriodOption(option: Int) {
        if option == 0 {
            
        } else if option == 1 {
            refresh()
            for tradeChart in tradeChartZip.TradeCharts {
                tradeBarViews.append(TradeBarView(tradeChart: tradeChart))
            }
            
            for tradeChart in tradeChartZip.TradeCharts {
                tradeBarViews.append(TradeBarView(tradeChart: tradeChart))
            }
            
            print(tradeBarViews.count)
            
            for (i, tradeBarView) in tradeBarViews.enumerated() {
                addSubview(tradeBarView)
                
                tradeBarView.translatesAutoresizingMaskIntoConstraints = false
                
                NSLayoutConstraint.activate([
                    tradeBarView.topAnchor.constraint(equalTo: typeSegmentControl.bottomAnchor, constant: 10),
                    tradeBarView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: CGFloat(1) / CGFloat(14)),
                    tradeBarView.bottomAnchor.constraint(equalTo: bottomAnchor),
                ])
                
                if tradeBarView == tradeBarViews.first {
                    NSLayoutConstraint.activate([
                        tradeBarView.leadingAnchor.constraint(equalTo: leadingAnchor),
                    ])
                } else if tradeBarView == tradeBarViews.last {
                    NSLayoutConstraint.activate([
                        tradeBarView.trailingAnchor.constraint(equalTo: trailingAnchor),
                    ])
                } else {
                    NSLayoutConstraint.activate([
                        tradeBarView.leadingAnchor.constraint(equalTo: tradeBarViews[i-1].trailingAnchor),
                    ])
                }
            }
        } else {
            
        }
    }
    
    func refresh() {
        for view in tradeBarViews {
            view.removeFromSuperview()
        }
        tradeBarViews.removeAll()
    }
}
