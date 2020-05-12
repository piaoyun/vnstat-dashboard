gitee地址（国内）：https://gitee.com/piaoyun/vnstat-dashboard

github地址（国外）：https://github.com/piaoyun/vnstat-dashboard

资源搬家，转自：https://github.com/alexandermarston/vnstat-dashboard/

主要是自用，方便国内用户下载


## 1.安装Web界面
首先需要安装PHP，可以使用lnmp组件来完成这一操作。
再安装`composer`.
新建一个`vhost`，此处假设根目录为`/home/wwwroot/vnstat`

### 国内：
```bash
cd /home/wwwroot
wget https://gitee.com/piaoyun/vnstat-dashboard/repository/archive/master.zip
unzip master.zip
mv vnstat-dashboard-master/app/* vnstat
rm vnstat-dashboard-master -rf
cd vnstat
composer install
nano includes/config.php
```

### 国外：
```bash
cd /home/wwwroot
wget https://github.com/piaoyun/vnstat-dashboard/archive/master.zip
unzip master.zip
mv vnstat-dashboard-master/app/* vnstat
rm vnstat-dashboard-master -rf
cd vnstat
composer install
nano includes/config.php
```

## 编辑配置文件：
```bash
// Set the default system Timezone，修改时区，东八区可以按以下设置，更多时区见https://www.php.net/manual/zh/timezones.php
date_default_timezone_set('Asia/Shanghai');

// Path of vnstat
$vnstat_bin_dir = '/usr/bin/vnstat';

// Set to true to set your own interfaces
$use_predefined_interfaces = false;

if ($use_predefined_interfaces == true) {
    $interface_list = ["ens18", "eth1"];

    $interface_name['eth0'] = "Internal #1";
    $interface_name['eth1'] = "Internal #2";
}
```

## 允许popen函数
此程序使用了popen函数来运行vnstat，而LNMP默认禁用了这个函数，所以需要更改PHP配置文件。否则Web界面是没有数据的。
```bash
nano /usr/local/php/etc/php.ini
```

找到`disable_functions`

```bash
disable_functions = passthru,system,chroot,chgrp,chown,shell_exec,proc_open,popen,proc_get_status,ini_alter,ini_restore,dl,openlog,syslog,readlink,symlink,popepassthru
```
将其中的`popen`去掉，然后重启PHP，`systemctl restart php-fpm。`
这样就可以啦。

# 截图演示
![YtjlqO.png](https://s1.ax1x.com/2020/05/12/YtjlqO.png)
![YtjMM6.png](https://s1.ax1x.com/2020/05/12/YtjMM6.png)
![YtjQsK.png](https://s1.ax1x.com/2020/05/12/YtjQsK.png)


# What is vnstat-dashboard?
This dashboard is an adaptation of vnstat-php-frontend by bjd using Bootstrap written in PHP. It provides the following:

* Hourly Statistics Chart (using Google Charts)
* Daily & Monthly Statistics Overview
* Top 10 Day Statistics
* Automatically populated interface selection

## Run it with Docker

### How to build it
``$ docker build . -t amarston/vnstat-dashboard:latest``

### How to publish it
``$ docker push amarston/vnstat-dashboard:latest``

### How to start it
``$ docker run --name vnstat-dashboard -p 80:80 -v /usr/bin/vnstat:/usr/bin/vnstat -v /var/lib/vnstat:/var/lib/vnstat -d amarston/vnstat-dashboard:latest``

### How to stop it
``$ docker stop vnstat-dashboard``

## Run it with Locally

### How to run it
```
$ cp -rp app/ /var/www/html/vnstat/
$ cd /var/www/html/vnstat/
$ composer install
```

## Licensing
Copyright (C) 2019 Alexander Marston (alexander.marston@gmail.com)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
