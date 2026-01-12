# Mimeda Bidding iOS SDK

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://swift.org/package-manager/)
[![Platform](https://img.shields.io/badge/platform-iOS%2013.0%2B-blue)](#gereksinimler)

Mimeda iOS SDK, event tracking ve performance monitoring özellikleri sunan bir iOS kütüphanesidir.

## Kurulum

### Swift Package Manager

Xcode'da projenize SDK'yı eklemek için:

1. **File > Add Packages...** menüsüne gidin
2. Aşağıdaki URL'yi girin:

```
https://github.com/Mimeda/bidding-mobile-ios-sdk-release.git
```

3. **Dependency Rule** olarak versiyonu seçin:
   - **Up to Next Major Version**: `1.0.0` (use latest version)

## Hızlı Başlangıç

### 1. Import

```swift
import bidding_mobile_ios_sdk
```

### 2. SDK'yı Başlatın

> **Not:** Session ID ve Anonymous ID, SDK tarafından otomatik olarak yönetilir.

#### SwiftUI

```swift
import SwiftUI
import bidding_mobile_ios_sdk

@main
struct MyApp: App {
    init() {
        MimedaSDK.shared.initialize(apiKey: "YOUR_API_KEY")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

#### UIKit

```swift
import UIKit
import bidding_mobile_ios_sdk

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        MimedaSDK.shared.initialize(apiKey: "YOUR_API_KEY")
        return true
    }
}
```

### 3. Event Tracking

```swift
import bidding_mobile_ios_sdk

// Home / View - Ana sayfa görüntüleme
MimedaSDK.shared.trackEvent(
    eventName: .home,
    eventParameter: .view,
    params: EventParams()
)

// Home / AddtoCart - Ana sayfadan sepete ekleme
MimedaSDK.shared.trackEvent(
    eventName: .home,
    eventParameter: .addToCart,
    params: EventParams(
        lineItemIds: "item123",
        productList: "SKU456:1:99.99"
    )
)

// Home / AddtoFavorites - Ana sayfadan favorilere ekleme
MimedaSDK.shared.trackEvent(
    eventName: .home,
    eventParameter: .addToFavorites,
    params: EventParams(
        lineItemIds: "item123",
        productList: "SKU456:1:99.99"
    )
)

// Listing / View - Ürün listesi görüntüleme
MimedaSDK.shared.trackEvent(
    eventName: .listing,
    eventParameter: .view,
    params: EventParams(
        categoryId: "electronics",
        totalRowCount: 50
    )
)

// Listing / AddtoCart - Liste sayfasından sepete ekleme
MimedaSDK.shared.trackEvent(
    eventName: .listing,
    eventParameter: .addToCart,
    params: EventParams(
        categoryId: "electronics",
        lineItemIds: "item123",
        productList: "SKU456:1:99.99"
    )
)

// Listing / AddtoFavorites - Liste sayfasından favorilere ekleme
MimedaSDK.shared.trackEvent(
    eventName: .listing,
    eventParameter: .addToFavorites,
    params: EventParams(
        categoryId: "electronics",
        lineItemIds: "item123",
        productList: "SKU456:1:99.99"
    )
)

// Search / View - Arama sonuçları görüntüleme
MimedaSDK.shared.trackEvent(
    eventName: .search,
    eventParameter: .view,
    params: EventParams(
        keyword: "elektronik",
        categoryId: "electronics"
    )
)

// Search / AddtoCart - Arama sonuçlarından sepete ekleme
MimedaSDK.shared.trackEvent(
    eventName: .search,
    eventParameter: .addToCart,
    params: EventParams(
        keyword: "elektronik",
        lineItemIds: "item123",
        productList: "SKU456:1:99.99"
    )
)

// Search / AddtoFavorites - Arama sonuçlarından favorilere ekleme
MimedaSDK.shared.trackEvent(
    eventName: .search,
    eventParameter: .addToFavorites,
    params: EventParams(
        keyword: "elektronik",
        lineItemIds: "item123",
        productList: "SKU456:1:99.99"
    )
)

// Product Detail Page / View - Ürün detay sayfası görüntüleme
MimedaSDK.shared.trackEvent(
    eventName: .pdp,
    eventParameter: .view,
    params: EventParams(
        lineItemIds: "item123",
        productList: "SKU456:1:99.99"
    )
)

// Product Detail Page / AddtoCart - Ürün detay sayfasından sepete ekleme
MimedaSDK.shared.trackEvent(
    eventName: .pdp,
    eventParameter: .addToCart,
    params: EventParams(
        lineItemIds: "item123",
        productList: "SKU456:1:99.99"
    )
)

// Product Detail Page / AddtoFavorites - Ürün detay sayfasından favorilere ekleme
MimedaSDK.shared.trackEvent(
    eventName: .pdp,
    eventParameter: .addToFavorites,
    params: EventParams(
        lineItemIds: "item123",
        productList: "SKU456:1:99.99"
    )
)

// Cart / View - Sepet sayfası görüntüleme
MimedaSDK.shared.trackEvent(
    eventName: .cart,
    eventParameter: .view,
    params: EventParams(
        lineItemIds: "item123,item456",
        productList: "SKU456:1:99.99,SKU789:2:149.99"
    )
)

// Purchase / Success - Satın alma işlemi başarılı
MimedaSDK.shared.trackEvent(
    eventName: .purchase,
    eventParameter: .success,
    params: EventParams(
        transactionId: "txn789",
        lineItemIds: "item123,item456",
        productList: "SKU456:1:99.99,SKU789:2:149.99"
    )
)
```

#### Event Türleri

| eventName | Açıklama |
|-----------|----------|
| `.home` | Ana sayfa |
| `.listing` | Ürün listesi |
| `.search` | Arama sonuçları |
| `.pdp` | Ürün detay sayfası |
| `.cart` | Sepet |
| `.purchase` | Satın alma |

| eventParameter | Açıklama |
|----------------|----------|
| `.view` | Sayfa görüntüleme |
| `.addToCart` | Sepete ekleme |
| `.addToFavorites` | Favorilere ekleme |
| `.success` | Başarılı işlem (satın alma) |

#### EventParams Parametreleri

Tüm parametreler opsiyoneldir.

| Parametre | Tip | Açıklama |
|-----------|-----|----------|
| `app` | String? | Uygulama adı |
| `userId` | String? | Kullanıcı ID |
| `lineItemIds` | String? | Line item ID'leri (virgülle ayrılmış) |
| `productList` | String? | Ürün listesi. Format: `SKU:adet:fiyat` (virgülle ayrılmış) |
| `categoryId` | String? | Kategori ID |
| `keyword` | String? | Arama kelimesi |
| `loyaltyCard` | String? | Sadakat kartı numarası |
| `transactionId` | String? | İşlem ID (satın alma için) |
| `totalRowCount` | Int? | Toplam satır sayısı (listeleme için) |

### 4. Performance Tracking

```swift
import bidding_mobile_ios_sdk

// Impression (Görüntülenme)
MimedaSDK.shared.trackPerformanceImpression(
    params: PerformanceEventParams(
        lineItemId: "line123",
        creativeId: "creative456",
        adUnit: "banner_top",
        productSku: "SKU789",
        payload: "custom_data",
        keyword: "electronics",
        userId: "user123"
    )
)

// Click (Tıklama)
MimedaSDK.shared.trackPerformanceClick(
    params: PerformanceEventParams(
        lineItemId: "line123",
        creativeId: "creative456",
        adUnit: "banner_top",
        productSku: "SKU789",
        payload: "custom_data"
    )
)
```

#### PerformanceEventParams Parametreleri

Tüm parametreler opsiyoneldir.

| Parametre | Tip | Açıklama |
|-----------|-----|----------|
| `app` | String? | Uygulama adı |
| `lineItemId` | String? | Line item ID |
| `creativeId` | String? | Creative ID |
| `adUnit` | String? | Reklam birimi adı |
| `productSku` | String? | Ürün SKU |
| `payload` | String? | Özel veri |
| `keyword` | String? | Arama kelimesi |
| `userId` | String? | Kullanıcı ID |

## Gereksinimler

| Gereksinim | Minimum Versiyon |
|------------|------------------|
| iOS        | 13.0+            |
| Swift      | 5.7+             |
| Xcode      | 14.0+            |

## Destek

- **Website:** [mimeda.com.tr](https://mimeda.com.tr)
- **Issues:** GitHub Issues
