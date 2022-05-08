//
//  Const.swift
//  moeum
//
//  Created by 송영모 on 2022/04/11.
//

import Foundation
import UIKit

struct Const {
    struct Font {
        static let largeTitle = UIFont.systemFont(ofSize: 34)
        static let title1 = UIFont.systemFont(ofSize: 28, weight: .semibold)
        static let title2 = UIFont.systemFont(ofSize: 22, weight: .semibold)
        static let title3 = UIFont.systemFont(ofSize: 20, weight: .semibold)
        static let headline = UIFont.systemFont(ofSize: 17, weight: .semibold)
        static let callout = UIFont.systemFont(ofSize: 16)
        static let subheadline = UIFont.systemFont(ofSize: 15)
        static let body = UIFont.systemFont(ofSize: 17)
        static let footnote = UIFont.systemFont(ofSize: 13)
        static let caption1 = UIFont.systemFont(ofSize: 12)
        static let caption2 = UIFont.systemFont(ofSize: 11)
        static let caption3 = UIFont.systemFont(ofSize: 10)
        static let caption4 = UIFont.systemFont(ofSize: 9)
        static let caption5 = UIFont.systemFont(ofSize: 8)
        
        static let itemHeadline = UIFont.systemFont(ofSize: 14, weight: .semibold)
        static let itemTitle1 = UIFont.systemFont(ofSize: 15, weight: .semibold)
        static let itemTitle2 = UIFont.systemFont(ofSize: 14)
        static let itemBody = UIFont.systemFont(ofSize: 13)
        static let itemFootnote = UIFont.systemFont(ofSize: 11)
    }
    
    struct Color {
        static let white = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        static let red = UIColor(red: 255/255, green: 69/255, blue: 58/255, alpha: 1)
        static let orange = UIColor(red: 255/255, green: 159/255, blue: 10/255, alpha: 1)
        static let yellow = UIColor(red: 255/255, green: 214/255, blue: 10/255, alpha: 1)
        static let green = UIColor(red: 48/255, green: 209/255, blue: 88/255, alpha: 1)
        static let mint = UIColor(red: 102/255, green: 212/255, blue: 207/255, alpha: 1)
        static let teal = UIColor(red: 64/255, green: 200/255, blue: 224/255, alpha: 1)
        static let cyan = UIColor(red: 100/255, green: 210/255, blue: 255/255, alpha: 1)
        static let blue = UIColor(red: 10/255, green: 132/255, blue: 255/255, alpha: 1)
        static let indigo = UIColor(red: 94/255, green: 92/255, blue: 230/255, alpha: 1)
        static let purple = UIColor(red: 191/255, green: 90/255, blue: 242/255, alpha: 1)
        static let pink = UIColor(red: 255/255, green: 55/255, blue: 95/255, alpha: 1)
        static let brown = UIColor(red: 172/255, green: 142/255, blue: 104/255, alpha: 1)
        static let black = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        static let darkGray = UIColor(white: 0.33, alpha: 1)
        static let systemGray = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
        static let systemGray2 = UIColor(red: 174/255, green: 174/255, blue: 178/255, alpha: 1)
        static let systemGray3 = UIColor(red: 199/255, green: 199/255, blue: 204/255, alpha: 1)
        static let systemGray4 = UIColor(red: 209/255, green: 209/255, blue: 214/255, alpha: 1)
        static let systemGray5 = UIColor(red: 229/255, green: 229/255, blue: 234/255, alpha: 1)
        static let systemGray6 = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
        
        static let buy = Const.Color.pink
        static let sell = Const.Color.mint
    }
    
    struct Size {
        static let chartBarMaxHeight = 50.0
        static let chartBarMinHeight = 0.0
        static let chartBarWidth = 50.0
        static let calendarHeaderMinHeight = 100.0
        static let calendarHeaderMaxHeight = 290.0
        static let calendarBottomSheetMinHeight = 400.0
    }
    
    struct Test {
        static let tradeChart1 = TradeChart(buyChart: Chart(value: 0.1, color: Const.Color.pink),
                                            sellChart: Chart(value: 0.2, color: Const.Color.mint))
        static let tradeChart2 = TradeChart(buyChart: Chart(value: 0.3, color: Const.Color.pink),
                                            sellChart: Chart(value: 0.5, color: Const.Color.mint))
        static let tradeChart3 = TradeChart(buyChart: Chart(value: 0.8, color: Const.Color.pink),
                                            sellChart: Chart(value: 0.1, color: Const.Color.mint))
        static let tradeChart4 = TradeChart(buyChart: Chart(value: 0.5, color: Const.Color.pink),
                                            sellChart: Chart(value: 0.6, color: Const.Color.mint))
        static let tradeChart5 = TradeChart(buyChart: Chart(value: 0.8, color: Const.Color.pink),
                                            sellChart: Chart(value: 0.9, color: Const.Color.mint))
        static let tradeChart6 = TradeChart(buyChart: Chart(value: 0.5, color: Const.Color.pink),
                                            sellChart: Chart(value: 0.4, color: Const.Color.mint))
        static let tradeChart7 = TradeChart(buyChart: Chart(value: 0.2, color: Const.Color.pink),
                                            sellChart: Chart(value: 0.4, color: Const.Color.mint))

    }
}

enum AppConfiguration {
  case Debug
  case TestFlight
  case AppStore
}

struct Config {
  // This is private because the use of 'appConfiguration' is preferred.
  private static let isTestFlight = Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt"
  
  // This can be used to add debug statements.
  static var isDebug: Bool {
    #if DEBUG
      return true
    #else
      return false
    #endif
  }

  static var appConfiguration: AppConfiguration {
    if isDebug {
      return .Debug
    } else if isTestFlight {
      return .TestFlight
    } else {
      return .AppStore
    }
  }
}
