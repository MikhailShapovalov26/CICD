# Jenkins deploy Dockerfile
В данном месте собран докер файл для установки и запуска jenkins на дебиан. В данном докер файле так же установлены пакеты для daemon docker.
Для запуска потребуется пара команд:

    docker build -t jenkins .

Далее после успешной сборки потребуется запустить, можно добавить свои параметры, в виде restart always добавить директории для mount и т.д.

    docker run -d --name=jenkins -v /var/run/docker.sock:/var/run/docker.sock  -p 8080:8080  jenkins 

Проверяем

    docker ps | grep jenkins

Заходим на ресурс http://localhost:8080/
Далее необходимо подставить copy the password from either location который можно достать командой

    docker exec -it jenkins cat /root/.jenkins/secrets/initialAdminPassword

Далее выбираем "Plugins extend Jenkins with additional features to support many different needs."
