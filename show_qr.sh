#!/bin/bash

# Проверка операционной системы
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo "Этот скрипт работает только на Linux."
    exit 1
fi

# Проверка и установка необходимых программ
if ! command -v qrencode &> /dev/null; then
    echo "Устанавливаем qrencode..."
    sudo apt-get update
    sudo apt-get install -y qrencode
fi

if ! command -v wg &> /dev/null; then
    echo "Устанавливаем WireGuard..."
    sudo apt-get update
    sudo apt-get install -y wireguard
fi

# Запрос пути к файлу конфигурации клиента WireGuard
read -p "Введите путь к файлу конфигурации клиента WireGuard: " config_path

# Проверка существования файла конфигурации
if [[ ! -f "$config_path" ]]; then
    echo "Файл конфигурации не найден!"
    exit 1
fi

# Отображение QR кода
qrencode -t ansiutf8 < "$config_path"
