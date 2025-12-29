# Beyin Tümörü Tespiti - Derin Öğrenme Projesi

Bu proje, MATLAB kullanarak beyin MR görüntülerinden tümör tespiti yapan bir derin öğrenme (CNN) modeli içermektedir.

## 📋 Proje Hakkında

Bu proje, beyin MR görüntülerini analiz ederek tümörlü ve tümörsüz görüntüleri sınıflandırmak için bir Evrişimli Sinir Ağı (CNN) modeli kullanmaktadır. Model, MATLAB Deep Learning Toolbox ile geliştirilmiştir.

## 🗂️ Proje Yapısı

```
deep-learning-brain-tumor-detection/
│
├── brainTumorCNN.m          # Ana eğitim scripti
├── brainTumorCNN.mat        # Eğitilmiş model dosyası
├── dashboard.mlapp          # MATLAB uygulama arayüzü
├── tumor/                   # Tümörlü görüntüler (4117 adet)
└── notumor/                 # Tümörsüz görüntüler (1595 adet)
```

## 🚀 Kullanım

### Gereksinimler

- MATLAB R2018b veya üzeri
- Deep Learning Toolbox
- Image Processing Toolbox

### Model Eğitimi

1. MATLAB'ı açın ve proje klasörüne gidin
2. `brainTumorCNN.m` dosyasını çalıştırın
3. Script otomatik olarak:
   - Veri setini yükler
   - Görüntüleri 224x224 gri tonlamalı formata dönüştürür
   - Veriyi %80 eğitim, %20 test olarak böler
   - CNN modelini eğitir
   - Model performansını değerlendirir
   - Eğitilmiş modeli `brainTumorCNN.mat` olarak kaydeder

### Model Mimarisi

Model aşağıdaki katmanlardan oluşmaktadır:

- **Giriş Katmanı**: 224x224x1 (gri tonlamalı görüntü)
- **Evrişim Katmanı 1**: 3x3 filtre, 8 filtre, padding="same"
- **ReLU Aktivasyon Katmanı**
- **Max Pooling Katmanı**: 2x2
- **Evrişim Katmanı 2**: 3x3 filtre, 16 filtre, padding="same"
- **ReLU Aktivasyon Katmanı**
- **Max Pooling Katmanı**: 2x2
- **Tam Bağlı Katman**: 2 sınıf (tumor/notumor)
- **Softmax Katmanı**
- **Sınıflandırma Katmanı**

### Eğitim Parametreleri

- **Optimizasyon Algoritması**: Adam
- **Maksimum Epoch**: 10
- **Mini Batch Boyutu**: 16
- **Veri Karıştırma**: Her epoch'ta

## 📊 Veri Seti

- **Tümörlü Görüntüler**: 4117 adet
- **Tümörsüz Görüntüler**: 1595 adet
- **Toplam**: 5712 görüntü
- **Görüntü Formatı**: JPG
- **İşleme**: Tüm görüntüler 224x224 piksel gri tonlamalı formata dönüştürülür

## 🎯 Kullanım Senaryoları

1. **Model Eğitimi**: `brainTumorCNN.m` scriptini çalıştırarak modeli sıfırdan eğitebilirsiniz
2. **Model Kullanımı**: Eğitilmiş `brainTumorCNN.mat` dosyasını yükleyerek yeni görüntüler üzerinde tahmin yapabilirsiniz
3. **Dashboard**: `dashboard.mlapp` dosyasını MATLAB'ta açarak görsel arayüz üzerinden modeli kullanabilirsiniz

## 📝 Notlar

- Script içindeki veri seti yolu (`C:\Users\berka\OneDrive\Desktop\Brain_Dataset`) kendi sisteminize göre güncellenmelidir
- Model performansı veri setinin kalitesine ve eğitim parametrelerine bağlıdır
- Daha iyi sonuçlar için hiperparametre optimizasyonu yapılabilir

## 🔧 Özelleştirme

Model performansını artırmak için:

- Epoch sayısını artırabilirsiniz
- Filtre sayılarını ve katman derinliğini artırabilirsiniz
- Veri artırma (data augmentation) teknikleri ekleyebilirsiniz
- Transfer learning kullanabilirsiniz (örn: ResNet, VGG)

## 📄 Lisans

Bu proje eğitim amaçlı geliştirilmiştir.

## 👤 Geliştirici

Proje geliştiricisi: Berkant Bayar

---

**Not**: Bu proje tıbbi teşhis amaçlı kullanılmamalıdır. Sadece eğitim ve araştırma amaçlıdır.

