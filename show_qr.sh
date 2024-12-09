#!/bin/bash

# Проверка операционной системы
OS=$(uname -s)

if [[ "$OS" != "Linux" ]]; then
    echo "Этот скрипт поддерживается только на Linux."
    exit 1
fi

# Проверка наличия необходимых программ: qrencode и wireguard-tools
if ! command -v qrencode &>/dev/null; then
    echo "qrencode не найден. Устанавливаю..."
    if [[ -f "/etc/debian_version" ]]; then
        sudo apt update && sudo apt install qrencode -y
    elif [[ -f "/etc/redhat-release" ]]; then
        sudo yum install qrencode -y
    else
        echo "Неизвестная операционная система для установки qrencode."
        exit 1
    fi
fi

if ! command -v wg &>/dev/null; then
    echo "Wireguard не найден. Устанавливаю..."
    if [[ -f "/etc/debian_version" ]]; then
        sudo apt update && sudo apt install wireguard-tools -y
    elif [[ -f "/etc/redhat-release" ]]; then
        sudo yum install wireguard-tools -y
    else
        echo "Неизвестная операционная система для установки wireguard-tools."
        exit 1
    fi
fi

# Запрос пути к файлу конфигурации клиента
read -p "Введите путь к файлу конфигурации Wireguard: " config_path

if [[ ! -f "$config_path" ]]; then
    echo "Файл не найден. Проверьте путь и попробуйте снова."
    exit 1
fi

# Генерация и отображение QR кода
cat "$config_path" | qrencode -t ANSIUTF8

