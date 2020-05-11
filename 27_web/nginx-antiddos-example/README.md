# Простая защита от ДДОС

## Защита от ДДОС средствами nginx
Написать конфигурацию nginx, которая даёт доступ клиенту только с определенной cookie.
Если у клиента её нет, нужно выполнить редирект на location, в котором кука будет добавлена, после чего клиент будет обратно отправлен (редирект) на запрашиваемый ресурс.

Смысл: умные боты попадаются редко, тупые боты по редиректам с куками два раза не пойдут

Для выполнения ДЗ понадобятся
* https://nginx.org/ru/docs/http/ngx_http_rewrite_module.html
* https://nginx.org/ru/docs/http/ngx_http_headers_module.html

## Защита от продвинутых ботов связкой nginx + java script (задание со *)

Защиту из предыдудщего задания можно проверить/преодолеть командой curl -c cookie -b cookie http://localhost/otus.txt -i -L
Ваша задача написать такую конфигурацию, которая отдает контент клиенту умеющему java script и meta-redirect

Для выполнения понадобятся:
* https://www.w3.org/TR/WCAG20-TECHS/H76.html
* http://nginx.org/en/docs/http/ngx_http_core_module.html#error_page
* Базовые знания java script 

## Инструкции для выполнения и сдачи
* Необходимо редактировать nginx.conf из этого репозитория (не следует использовать include и править Dockerfile)
* Cделанную работу нужно залить hub.docker.com, при этом content в otus.txt должен содержать в себе название Вашего репозитория hub.docker.com и только его
* Базовое задание должно быть в образе с тегом latest, задание для продвинутых в образе с тегом advanced.
* Самопроверка: docker run -p 80:80 your_account/your_repo:latest (или your_account/your_repo:advanced) - запустит nginx c выполненым заданием. сurl http://localhost/otus.txt - редирект(или ошибка) , открыв ту же страницу в браузере - увидим your_account/your_repo
