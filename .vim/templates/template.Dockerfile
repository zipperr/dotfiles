FROM docker.io/centos:6
MAINTAINER vagrant

# MySQL 5.6
RUN yum -y install http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
RUN yum -y install mysql-community-server
EXPOSE 3306

# MySQL initialize
RUN service mysqld start && mysql -e "GRANT ALL ON *.* to 'root'@'%'; FLUSH PRIVILEGES;" && service mysqld stop

ADD init.sh /usr/local/bin/init.sh
RUN chmod u+x /usr/local/bin/init.sh
CMD ["/user/lobal/bin/init.sh"]
