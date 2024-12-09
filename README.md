## Отображение конфигурации клиента WireGuard в виде QR-кода

Этот скрипт позволяет отобразить конфигурацию клиента WireGuard в виде QR-кода в терминале. Он выполняет следующие шаги:
1. **Проверяет, относится ли операционная система к семейству Linux**: Убедитесь, что скрипт запускается на совместимой системе.
2. **Проверяет наличие необходимых программ**: Проверяет наличие `qrencode` и `wireguard-tools`. Если нет, установит их.
3. **Запрашивает путь к файлу конфигурации клиента WireGuard**: Попросит пользователя указать путь к файлу конфигурации клиента.
4. **Отображает QR-код в терминале**: Использует `qrencode` для отображения конфигурации в виде QR-кода.

### Требования

- Операционная система Debian, Red Hat (ОС с пакетными менеджерами apt и yum)
- Bash

### Использование

1. Сохраните скрипт как `show_qr.sh`.
2. Сделайте скрипт исполняемым:
   ```bash
   chmod +x show_qr.sh
   ```
3. Запустите скрипт:
   ```bash
   ./show_qr.sh
   ```
4. Следуйте подсказкам, чтобы ввести путь к файлу конфигурации клиента WireGuard. QR-код будет отображен в терминале.

### Пример

```sh
$ ./show_qr.sh
Введите путь к файлу конфигурации клиента WireGuard: /path/to/client.conf
```

### Примечания

- Убедитесь, что у вас есть необходимые разрешения для установки пакетов с помощью `apt-get` или `yum`.
- Скрипт проверяет и устанавливает `qrencode` и `wireguard-tools`, если они не установлены в вашей системе.

### Лицензия

Этот проект лицензирован по лицензии MIT - подробнее см. в файле [LICENSE](LICENSE).

