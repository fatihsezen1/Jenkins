#!/bin/bash

set -e  # herhangi bir hata olursa script durur

# Renkli çıktılar için
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# 1. Build klasörünü temizle ve yeniden oluştur
echo -e "${GREEN}[*] Temizleniyor: build klasörü...${NC}"
rm -rf build
mkdir build
cd build

# 2. CMake ve Make ile projeyi derle
echo -e "${GREEN}[*] CMake ve Make ile derleniyor...${NC}"
cmake ..
make -j$(nproc)

# 3. Testleri çalıştır
echo -e "${GREEN}[*] Testler çalıştırılıyor...${NC}"
ctest --output-on-failure

# 4. Derlenen binary'yi hedef dizine kopyala
echo -e "${GREEN}[*] Dağıtım yapılıyor...${NC}"
cd ..
mkdir -p bin
cp build/MyApp /tmp/my_cpp_app

echo -e "${GREEN}[✓] Başarıyla derlendi ve dağıtıldı.${NC}"
