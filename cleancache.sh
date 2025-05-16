#!/bin/bash

echo "🧹 Очистка Xcode..."

# Derived Data
rm -rf ~/Library/Developer/Xcode/DerivedData

# Кэш Xcode
rm -rf ~/Library/Caches/com.apple.dt.Xcode
rm -rf ~/Library/Developer/Xcode/Archives
rm -rf ~/Library/Developer/Xcode/Products
rm -rf ~/Library/Developer/Xcode/iOS\ DeviceSupport

# Остановка и очистка симуляторов (опционально)
xcrun simctl shutdown all
xcrun simctl erase all

echo "✅ Xcode очищен."

echo "🧹 Очистка Gradle..."

# Глобальный кэш Gradle
rm -rf ~/.gradle/caches
rm -rf ~/.gradle/daemon
rm -rf ~/.gradle/native
rm -rf ~/.gradle/wrapper

# Локальные кэши внутри проекта (если в каталоге проекта)
if [ -d "./.gradle" ]; then
    rm -rf ./.gradle
    echo "✅ Локальный .gradle очищен."
fi

echo "✅ Gradle очищен."

echo "🎉 Все кэши удалены."