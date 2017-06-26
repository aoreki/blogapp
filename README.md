# ubuntu server + nginx + passenger + rails + mysql

1.装git                 

    sudo apt-get update

    sudo apt-get install git

2.装curl                      

    sudo apt-get install curl

3.装rvm

    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

    \curl -sSL https://get.rvm.io | bash -s stable

    source /home/ubuntu/.rvm/scripts/rvm

4.装ruby

    rvm install ruby-2.3.1

5.装bundler

    gem install bundler --no-rdoc --no-ri

6.装nodejs

    sudo apt-get install nodejs 

7.安装passenger和nginx

    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7

    sudo apt-get install -y apt-transport-https ca-certificates

    sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main > /etc/apt/sources.list.d/passenger.list'

    sudo apt-get update

    sudo apt-get install -y nginx-extras passenger

8.配置nginx，检查安装项

    include /etc/nginx/passenger.conf;

    sudo service nginx restart

    sudo /usr/bin/passenger-config validate-install

    sudo /usr/sbin/passenger-memory-stats

9.更新

    sudo apt-get update

    sudo apt-get upgrade

10.安装mysql数据库

    sudo apt-get install mysql-server

    sudo apt-get install mysql-client

    sudo apt-get install libmysqlclient-dev

11.取代码

    mkdir blog

    cd blog

    git init

    git remote add origin https://github.com/aoreki/blogapp.git

    bundle install

12.配置rails                             

    添加secret_key_base:在/etc/profile.d/目录下新建secret_key_base.sh文件，输入export SECRET_KEY_BASE="#{rails secret}"

    配置databse.yml

    迁移数据库:rails db:migrate RAILS_ENV=production   rails db:seed RAILS_ENV=production

13.配置nginx和passenger             

    passenger-config about ruby-command

    /etc/nginx/sites-enabled/目录下创建.conf文件配置nginx，添加passenger_enabled on;
    
    passenger_ruby /home/ubuntu/.rvm/gems/ruby-2.3.1/wrappers/ruby;

    /etc/nginx/nginx.conf中添加include /etc/nginx/passenger.conf;
    
## 自动化部署环境参考[capistrano](https://www.phusionpassenger.com/library/deploy/nginx/automating_app_updates/ruby/)
