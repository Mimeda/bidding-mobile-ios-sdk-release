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
// Basit event
MimedaSDK.shared.trackEvent(
    eventName: .home,
    eventParameter: .view
)

// Parametreli event
MimedaSDK.shared.trackEvent(
    eventName: .pdp,
    eventParameter: .addToCart,
    params: EventParams(
        lineItemIds: "item123",
        productList: "08060192:1:10.50"  // format: SKU:adet:fiyat
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
// Impression
MimedaSDK.shared.trackPerformanceImpression(
    params: PerformanceEventParams(
        lineItemId: "line123",
        creativeId: "creative456",
        adUnit: "banner_top"
    )
)

// Click
MimedaSDK.shared.trackPerformanceClick(
    params: PerformanceEventParams(
        lineItemId: "line123",
        creativeId: "creative456",
        adUnit: "banner_top"
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
