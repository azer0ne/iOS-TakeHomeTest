//
//  PerbandinganViewModel.swift
//  iOS-TakeHomeTest
//
//  Created by Abiyyu Firmansyah on 09/01/24.
//

import Foundation

class PerbandinganViewModel {
    
    let apiClient = ApiClient()
    
    func getProduct() {
        apiClient.getData(endpoint: .productDetail) { result in
            switch result {
            case .success(let data):
                print("Product Detail Data: \(data)")
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func getChart() {
        apiClient.getData(endpoint: .charts) { result in
            switch result {
            case .success(let data):
                print("Charts Data: \(data)")
            case .failure(let error):
                print("Error: \(error)")
            }
            
        }
    }
}

extension PerbandinganViewModel {
    
    struct ProductViewModel {
        
        private var model: ProductDataResponse.ProductData

        var productTitle: String {
            model.name
        }
        var productImage: URL {
            URL(string: model.details.imAvatar)!
        }
        
        struct ProductDetails {
            let title: String
            let value: String
        }
        
        private func imbalHasil() -> String {
            switch model.details.type {
            case "Pasar Uang":
                return String(String(model.details.returnOneYear) + "% / thn")
            case "Saham":
                return String(String(model.details.returnFiveYear) + "% / 5 thn")
            default:
                return ""
            }
        }
        
        private func danaKelolaan() -> String {
            (Double(model.details.totalUnit) * model.details.nav).formattedPrice
        }
        
        private func minPembelian() -> String {
            Double(model.details.minSubscription).formattedPrice
        }
        
        private func jangkaWaktu() -> String {
            switch model.details.type {
            case "Pasar Uang":
                return "1 tahun"
            case "Saham":
                return "5 tahun"
            default:
                return ""
            }
        }
        
        private func resiko() -> String {
            switch model.details.type {
            case "Pasar Uang":
                return "Rendah"
            case "Saham":
                return "Tinggi"
            default:
                return ""
            }
        }
        
        private func peluncuran() -> String {
            model.details.inceptionDate.dateFormatter()
        }


        var detail: [ProductDetails] {
            [
                ProductViewModel.ProductDetails(title: "Jenis Reksa Dana", value: model.details.type),
                ProductViewModel.ProductDetails(title: "Imbal Hasil", value: imbalHasil()),
                ProductViewModel.ProductDetails(title: "Dana Kelolaan", value: danaKelolaan()),
                ProductViewModel.ProductDetails(title: "Min. Pembelian", value: minPembelian()),
                ProductViewModel.ProductDetails(title: "Jangka Waktu", value: jangkaWaktu()),
                ProductViewModel.ProductDetails(title: "Tingkat Resiko", value: resiko()),
                ProductViewModel.ProductDetails(title: "Peluncuran", value: peluncuran())
                
            ]
        }

    }
}

extension Double {
    var formattedPrice: String {
        switch self {
        case ..<1_000:
            return String(format: "%.0f", locale: Locale.current, self)
        case 1_000 ..< 999_999:
            return String(format: "%.1f Ribu", locale: Locale.current, self / 1_000).replacingOccurrences(of: ".0", with: "")
        case 1_000_000 ..< 999_999_999:
            return String(format: "%.1f Juta", locale: Locale.current, self / 1_000_000).replacingOccurrences(of: ".0", with: "")
        case 1_000_000_000 ..< 999_999_999_999:
            return String(format: "%.1f Miliyar", locale: Locale.current, self / 1_000_000_000).replacingOccurrences(of: ".0", with: "")
        default:
            return String(format: "%.1f Triliun", locale: Locale.current, self / 1_000_000_000_000).replacingOccurrences(of: ".0", with: "")
        }
    }
}

extension String {
    func dateFormatter() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "id")
        formatter.dateFormat = "yyyy-MM-dd"
        let ObjDate = formatter.date(from: self)
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: ObjDate!)
    }

}
