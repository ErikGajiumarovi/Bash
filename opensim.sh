#!/bin/bash

# Укажи bundle identifier своего приложения
BUNDLE_ID="com.argonaut.Respondent"

# Получаем путь к data-контейнеру приложения
APP_PATH=$(xcrun simctl get_app_container booted "$BUNDLE_ID" data)

# Строим путь к Application Support
APP_SUPPORT_PATH="$APP_PATH/Library/Application Support"

# Проверяем успешность
if [ -d "$APP_SUPPORT_PATH" ]; then
    echo "Открываем: $APP_SUPPORT_PATH"
    open "$APP_SUPPORT_PATH"
elif [ -d "$APP_PATH" ]; then
    echo "Application Support не найден. Открываю корневой контейнер: $APP_PATH"
    open "$APP_PATH"
else
    echo "❌ Контейнер не найден. Проверь симулятор и bundle id."
fi
