# 1.
Сделать Freestyle Job, который будет запускать ansible-playbook из форка репозитория

    Started by user Shapovalov
    Running as SYSTEM
    Building in workspace /var/lib/jenkins/.jenkins/workspace/Freestyle Job
    The recommended git tool is: NONE
    No credentials specified
    Cloning the remote Git repository
    Cloning repository https://github.com/MikhailShapovalov26/example-playbook.git
    > git init /var/lib/jenkins/.jenkins/workspace/Freestyle Job # timeout=10
    Fetching upstream changes from https://github.com/MikhailShapovalov26/example-playbook.git
    > git --version # timeout=10
    > git --version # 'git version 1.8.3.1'
    > git fetch --tags --progress https://github.com/MikhailShapovalov26/example-playbook.git +refs/heads/*:refs/remotes/origin/* # timeout=10
    > git config remote.origin.url https://github.com/MikhailShapovalov26/example-playbook.git # timeout=10
    > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
    Avoid second fetch
    > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
    Checking out Revision 7c0b99e0464c8c4cf2ac3e9d802379edfe06df00 (refs/remotes/origin/master)
    > git config core.sparsecheckout # timeout=10
    > git checkout -f 7c0b99e0464c8c4cf2ac3e9d802379edfe06df00 # timeout=10
    Commit message: "Update secret"
    First time build. Skipping changelog.
    Finished: SUCCESS
# 2.
Сделать Declarative Pipeline, который будет выкачивать репозиторий с плейбукой и запускать её

    Started by user Shapovalov
    Obtained Jenkinsfile from git https://github.com/MikhailShapovalov26/example-playbook.git
    [Pipeline] Start of Pipeline
    [Pipeline] node
    Running on Jenkins in /var/lib/jenkins/.jenkins/workspace/Declarative Pipeline
    [Pipeline] {
    [Pipeline] stage
    [Pipeline] { (Declarative: Checkout SCM)
    [Pipeline] checkout
    Selected Git installation does not exist. Using Default
    The recommended git tool is: NONE
    No credentials specified
    Cloning the remote Git repository
    Cloning repository https://github.com/MikhailShapovalov26/example-playbook.git
    > git init /var/lib/jenkins/.jenkins/workspace/Declarative Pipeline # timeout=10
    Fetching upstream changes from https://github.com/MikhailShapovalov26/example-playbook.git
    > git --version # timeout=10
    > git --version # 'git version 1.8.3.1'
    > git fetch --tags --progress https://github.com/MikhailShapovalov26/example-playbook.git +refs/heads/*:refs/remotes/origin/* # timeout=10
    > git config remote.origin.url https://github.com/MikhailShapovalov26/example-playbook.git # timeout=10
    > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
    Avoid second fetch
    > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
    Checking out Revision 7c0b99e0464c8c4cf2ac3e9d802379edfe06df00 (refs/remotes/origin/master)
    > git config core.sparsecheckout # timeout=10
    > git checkout -f 7c0b99e0464c8c4cf2ac3e9d802379edfe06df00 # timeout=10
    Commit message: "Update secret"
    First time build. Skipping changelog.
    [Pipeline] }
    [Pipeline] // stage
    [Pipeline] withEnv
    [Pipeline] {
    [Pipeline] stage
    [Pipeline] { (First stage)
    [Pipeline] echo
    I'm runing
    [Pipeline] }
    [Pipeline] // stage
    [Pipeline] stage
    [Pipeline] { (Second stage)
    [Pipeline] echo
    And I'm too
    [Pipeline] }
    [Pipeline] // stage
    [Pipeline] }
    [Pipeline] // withEnv
    [Pipeline] }
    [Pipeline] // node
    [Pipeline] End of Pipeline
    Finished: SUCCESS
# 4.
Перенастроить Job на использование Jenkinsfile из репозитория

    Started by user Shapovalov
    Running as SYSTEM
    Building in workspace /var/lib/jenkins/.jenkins/workspace/Freestyle Job
    Finished: SUCCESS
# 5.
    tarted by user Shapovalov
    [Pipeline] Start of Pipeline
    [Pipeline] node
    Running on Jenkins in /root/.jenkins/workspace/Scripted Pipeline
    [Pipeline] {
    [Pipeline] stage
    [Pipeline] { (Git checkout)
    [Pipeline] git
    The recommended git tool is: NONE
    Warning: CredentialId "SECRET" could not be found.
    > git rev-parse --resolve-git-dir /root/.jenkins/workspace/Scripted Pipeline/.git # timeout=10
    Fetching changes from the remote Git repository
    > git config remote.origin.url https://github.com/MikhailShapovalov26/example-playbook.git # timeout=10
    Fetching upstream changes from https://github.com/MikhailShapovalov26/example-playbook.git
    > git --version # timeout=10
    > git --version # 'git version 1.8.3.1'
    > git fetch --tags --progress https://github.com/MikhailShapovalov26/example-playbook.git +refs/heads/*:refs/remotes/origin/* # timeout=10
    > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
    Checking out Revision 16a1ddacc25daf1c033a396a44cf572d5005f0e9 (refs/remotes/origin/master)
    > git config core.sparsecheckout # timeout=10
    > git checkout -f 16a1ddacc25daf1c033a396a44cf572d5005f0e9 # timeout=10
    > git branch -a -v --no-abbrev # timeout=10
    > git branch -D master # timeout=10
    > git checkout -b master 16a1ddacc25daf1c033a396a44cf572d5005f0e9 # timeout=10
    Commit message: "Update requirements.yml"
    > git rev-list --no-walk f3188272e96e1de616a52846c9d9fa533d8a93b6 # timeout=10
    [Pipeline] }
    [Pipeline] // stage
    [Pipeline] stage
    [Pipeline] { (Check ssh key)
    [Pipeline] }
    [Pipeline] // stage
    [Pipeline] stage
    [Pipeline] { (Run playbook)
    [Pipeline] sh
    + ansible-galaxy install -r requirements.yml
    - extracting java to /root/.ansible/roles/java
    - java (1.0.1) was installed successfully
    [Pipeline] sh
    + ansible-playbook -i inventory/prod.yml site.yml

    PLAY [Install Java] ************************************************************

    TASK [Gathering Facts] *********************************************************
    ok: [localhost]

    TASK [java : Upload .tar.gz file containing binaries from local storage] *******
    skipping: [localhost]

    TASK [java : Upload .tar.gz file conaining binaries from remote storage] *******
    changed: [localhost]

    TASK [java : Ensure installation dir exists] ***********************************
    changed: [localhost]

    TASK [Extract java in the installation directory] ******************************
    changed: [localhost]

    TASK [java : Export environment variables] *************************************
    changed: [localhost]

    PLAY RECAP *********************************************************************
    localhost                  : ok=5    changed=4    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   

    [Pipeline] }
    [Pipeline] // stage
    [Pipeline] }
    [Pipeline] // node
    [Pipeline] End of Pipeline
    Finished: SUCCESS

# 6.
ScriptedJenkiknsfileq

    node {
        stage("Git checkout"){
            git branch: 'master',
                credentialsId: 'SECRET',
                url: 'https://github.com/MikhailShapovalov26/example-playbook.git'
        }
        stage("Check ssh key"){
            secret_check=true
        }
        stage("Run playbook"){
            if (secret_check){
                sh 'ansible-galaxy install -r requirements.yml'
                sh 'ansible-playbook -i inventory/prod.yml site.yml'
            }
            else{
                echo 'no more keys'
            }
            
        }
    }
Для выполнения пришлось править [requirements.yml](https://github.com/MikhailShapovalov26/example-playbook/blob/master/requirements.yml) 

    ---
    - src: https://github.com/netology-code/mnt-homeworks-ansible.git
        scm: git
        version: "1.0.1"
        name: java
        path: ./java