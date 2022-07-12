//
//  Currency.swift
//  Expense
//
//  Created by Егор Бадмаев on 13.07.2022.
//

@objc public enum Currency: Int32 {
    case eur
    case usd
    case rub // Russian Ruble
    case frf // French Franc
    case gbp // Pound Sterling
    case uah // Ukrainian Hryvnia
    case kzt // Kazakhstani Tenge
    case byn // Belarusian Ruble
    case `try` // Turkish Lira
    case cny // Chinese Yuan
    
    var symbol: String {
        switch self {
        case .eur:
            return "€"
        case .usd:
            return "$"
        case .rub:
            return "₽"
        case .frf:
            return "₣"
        case .gbp:
            return "£"
        case .uah:
            return "₴"
        case .kzt:
            return "₸"
        case .byn:
            return "₽"
        case .try:
            return "₤"
        case .cny:
            return "¥"
        }
    }
    
    // Letters by ISO 4217
    var letters: String {
        switch self {
        case .eur:
            return "EUR"
        case .usd:
            return "USD"
        case .rub:
            return "RUB"
        case .frf:
            return "FRF"
        case .gbp:
            return "GBP"
        case .uah:
            return "UAH"
        case .kzt:
            return "KZT"
        case .byn:
            return "BYN"
        case .try:
            return "TRY"
        case .cny:
            return "CNY"
        }
    }
}
