# concrete5 Easy Install Shell Script for Cloud9

This is the easy to use install script. I've first made one for Cloud9.

Japanese instruction follows English instruction.

[日本語の解説](#日本語)は、英語の後にございます。

## Installing to Cloud9

### YouTube Turotial

Video tutorial is now available!

https://www.youtube.com/watch?v=zS-F4Yk4TQs

### Instroduction

I assume you already know how to use Cloud9. If not, [sign up](https://c9.io/c/t3lGIvLecba) and read [their doc](https://docs.c9.io/docs) for the detail.

Run the following commands and modify the config from Cloud9

- Create a new workspace using PHP, Apache, MySQL template.
- Copy and paste the following command within Cloud9 command window. (Make sure to *return* the `exit;` to exit MySQL). This commands will start MySQL and create a MySQL user, `concrete5`, with password, `concrete5`.
```
mysql-ctl start
mysql-ctl cli
CREATE USER 'concrete5'@'127.0.0.1' IDENTIFIED BY 'concrete5';
GRANT ALL PRIVILEGES ON *.* TO 'concrete5'@'127.0.0.1' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit;

```

#### Install LEMP

The script also installs LEMP (nginx, php7 with php-fpm) and replace the original Apache. It will run concrete5 much faster.

- Obtain the `instal.cloud9.bash` script and modify it according to your preference. I recommend you to change `ADMIN_EMAIL` (Your concrete5's admin email address), `ADMIN_PASS` (concrete5's admin password) , `SITE_NAME` (concrete5's site name). Check out the config option table below. Then saved it on remote server such as your own GitHub repo or Gist, or saved it onto Cloud9.
- Run the installation using the following methods.
    - (1) Get remote bash and run it locally
        - Example: `curl https://raw.githubusercontent.com/katzueno/concrete5-install-shell-scripts/master/install.cloud9.bash > install.cloud9.bash`
        - Open the install.cloud9.bash into Cloud9 editor and modify the admin email, admin password, site name or other preferences if you wish. See the config section below.
        - Run 
            - `chmod 700 install.cloud9.bash`
            - `bash install.cloud9.bash`
    - (2) Save your own `install.cloud9.bash` file remotely, fetch and run it remotely
        - Example `curl https://raw.githubusercontent.com/katzueno/concrete5-install-shell-scripts/master/install.cloud9.bash | bash`
- DONE

**You will not be able to use START and STOP button of Cloud9. You must type the following commands to control the web server**

**CAUTION: YOU MUST change your password** If you run a lot of concrete5 installs, I recommend you to fork this Git onto your private repo, or private Gist.

Command        | Description
---------------|---------------------
`lemp start`   | Starts Nginx and PHP
`lemp stop`    | Stops Nginx and PHP
`lemp restart` | Restarts Nginx and PHP
`lemp status`  | Shows the current status


#### Run without LEMP

- Obtain the `instal.cloud9.bash` script and modify it according to your preference.
    - Make sure to change `INSTALL_LEMP` option to `no`.
    - I recommend you to change `ADMIN_EMAIL` (Your concrete5's admin email address), `ADMIN_PASS` (concrete5's admin password) , `SITE_NAME` (concrete5's site name). Check out the config option table below. Then saved it on remote server such as your own GitHub repo or Gist, or saved it onto Cloud9.
- Run the installation using the following methods.
    - (1) Get remote bash and run it locally
        - Example: `curl https://raw.githubusercontent.com/katzueno/concrete5-install-shell-scripts/master/install.cloud9.bash > install.cloud9.bash`
        - Open the install.cloud9.bash into Cloud9 editor and modify the admin email, admin password, site name or other preferences if you wish. See the config section below.
        - Run 
            - `chmod 700 install.cloud9.bash`
            - `bash install.cloud9.bash`
    - (2) Save your own `install.cloud9.bash` file remotely, fetch and run it remotely
        - Example `curl https://raw.githubusercontent.com/katzueno/concrete5-install-shell-scripts/master/install.cloud9.bash | bash`
- Click "Run Project" to start a Apache server
- DONE

**CAUTION: YOU MUST change your password** If you run a lot of concrete5 installs, I recommend you to fork this Git onto your private repo, or private Gist.

### Config Options

Check where the VARIABLE in the  `install.cloud9.bash` script and change wherever necessary. 

Parameter           | Default Value | Description
----------          | ------------ | -----
CONCRETE5_DOWNLOAD  | Please check | This is download URL of concrete5 zip file
CONCRETE5_VERSION   | Please check | You MUST change it you are downloading the different version
DESTINATION         | "/home/ubuntu/workspace" | This script will install onto the top directory of Cloud9. Change it if you wish to install onto different directory.
CONCRETE_PHP_RAW    | "https://raw.githubusercontent.com/katzueno/cloud9-concrete5-install-script/master/config/concrete.php" | This is the special script to be able to run concrete5 on Cloud9. [Read here](https://www.concrete5.org/community/forums/installation/concrete5-on-cloud9/) for more detail.
INSTALL_LEMP        | "yes" | "yes" to set up a LEMP environment using NGINX and PHP-FPM by using [c9-lemp](https://github.com/GabrielGil/c9-lemp) script. This will take some time to complete.
INSTALL_PHPMYADMIN  | "yes" | "yes" to install phpMyAdmin. Remove this line if you don't want to.
INSTALL_CONCRETE5   | "no" | "yes" to run concrete5 install command to install concrete5, and fill out the options below.
ADMIN_EMAIL         | "concrete5@example.com" | Change it to your email address
ADMIN_PASS          | "t4wbSIDuQgfy" | **IMPORTANT!** This is your concrete5's admin password. So make sure to change it.
SITE_NAME           | "concrete5 demo" | concrete5 site name.
SAMPLE_DATA         | "elemental_full" | If you want to install the blank sample data, use "elemental_blank"
MYSQL_USER          | "concrete5" | You need to create the MySQL User.
MYSQL_PASS          | "concrete5" | You need to create the MySQL Password
MYSQL_SERVER        | "127.0.0.1" | MySQL Server Address
MYSQL_DATABASE      | "c9" | MySQL Database Name
CONCRETE5_LOCALE    | "en_US" | **This option doesn't work yet for Cloud9.** Indicate the concrete5's default locale on install. You MUST specify the default locale when installing concrete5 since Ver 8.0.0 if you want to set the default locale rather than en_US.

## License

This script is released under MIT License.

## Credit

@katzueno (concret5 Japan, Inc.)

concrete5 Japan, Inc. is helping various company's concrete5 project. Please feel free to contact us at any time for your project needs. We can work internationally.

https://concrete5.co.jp/

## 日本語

日本語での説明はこちらです。 Cloud9 の基本操作はすでに知っている方向けに書いています。そうでない方は、まず、[Cloud9に登録して](https://c9.io/c/t3lGIvLecba)、こちらの記事を読むのをお勧めします。

- [プログラミングの開発環境に便利！Cloud9の使い方 | TechAcademyマガジン](http://techacademy.jp/magazine/6168)

### YouTube 動画

YouTube に解説動画をアップロードしました。

https://www.youtube.com/watch?v=TPmUvPsgoOQ


### 使用方法

下記の方法で、Cloud9 のコマンドを実行してください。テキストファイルの変更も必要です。

- Cloud9 の管理画面から `Create a new workspace` をクリックし、PHP, Apache, MySQL テンプレートを選択して、Workspace を作成します。
- 下記のコマンドをコピーして、コマンドウインドウでそのまま実行してください。 (最後の`exit;` をきちんと *改行* し MySQL を終了してください)。このコマンドで MySQL ユーザー「concrete5」とパスワード「concrete5」を設定します。
```
mysql-ctl start
mysql-ctl cli
CREATE USER 'concrete5'@'127.0.0.1' IDENTIFIED BY 'concrete5';
GRANT ALL PRIVILEGES ON *.* TO 'concrete5'@'127.0.0.1' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit;

```
- 「instal.cloud9.bash」ファイルをテキストエディタで開いて `ADMIN_EMAIL` (自分のメールアドレス), `ADMIN_PASS` (admin ユーザーのパスワード) , `SITE_NAME` (サイト名) や他の設定情報を変更してください。下記に設定項目の説明があります。この Bash ファイルを、自分の GitHub のレポジトリや Gist などに保存するか、Cloud9 のファイルマネージャーに保存します。
- 下記のいずれかの方法でインストールを実行します。
    - (1) ローカルにスクリプトを取得して内容を変更したあと実行する
        - コマンドを実行してファイルを取得する。
            - 例: `curl https://raw.githubusercontent.com/katzueno/concrete5-install-shell-scripts/master/install.cloud9.bash > install.cloud9.bash` 
        - `install.cloud9.bash` ファイルを Cloud9 のテキストエディアで開いて、admin ユーザーのメールアドレス、パスワード、サイト名などを修正してください。
        - 下記のコマンドを実行してインストールを実行する。
            - `chmod 700 install.cloud9.bash`
            - `bash install.cloud9.bash`
    - (2) リモートに、内容を修正した `install.cloud9.bash` ファイルを保存し、それをを取得＆直接実行する
        - 例: `curl https://raw.githubusercontent.com/katzueno/concrete5-install-shell-scripts/master/install.cloud9.bash | bash`
- "Run Project"ボタンを押して、Apache サーバーを起動し、concrete5 にアクセス
- インストール完了


**注意: パスワードは変えてください。** シェルスクリプトをプライベートレポジトリやシークレットGistなどに Fork することをお勧めします。


### 設定オプション

`install.cloud9.bash`の「VARIABLE」のところで設定できる項目です。適宜変更してください。


パラメーター        | デフォルト値 | 説明
----------          | ------------ | -----
CONCRETE5_DOWNLOAD  | "http://www.concrete5.org/download_file/-/view/85780/" | これは concrete5 本体パッケージのダウンロード先 URL です。
CONCRETE5_VERSION   | "concrete5.7.5.6" | 上記 concrete5 の ZIP ファイルを解答した時に生成されるフォルダ名です。
DESTINATION         | "/home/ubuntu/workspace" | concrete5 のインストール先ディレクトリを指定します。デフォルトでは Cloud9 のトップディレクトリにインストールします。
CONCRETE_PHP_RAW    | "https://raw.githubusercontent.com/katzueno/cloud9-concrete5-install-script/master/config/concrete.php" | Cloud9 で concrete5 を動かすための config ファイルです。詳細は[こちら](https://concrete5.co.jp/blog/cloud9-concrete5)をご覧ください。
INSTALL_LEMP        | "yes" | 「yes」で[c9-lemp](https://github.com/GabrielGil/c9-lemp) というスクリプトを実行して Cloud9 に LEMP 環境 (nginx, PHP-FPM, PHP7) を構築します。セットアップに少々時間がかかります。
INSTALL_PHPMYADMIN  | "yes" | "yes" で phpMyAdmin をインストールします。必要なければコメントアウトするか、この行を削除してください。
INSTALL_CONCRETE5   | "no" | **Cloud9でロケールの設定がうまくできないため、No にしています** 「yes」 で concrete5 のインストールコマンドを自動的に実行します。ファイルのインストール後、インストール画面よりインストールしてください。下記のパラメータはインストールコマンドを実行するときのみに使われます。
ADMIN_EMAIL         | "concrete5@example.com" | 自分のメールアドレスに変更してください。
ADMIN_PASS          | "t4wbSIDuQgfy" | **重要!** これは concrete5 の「admin」のパスワードです。必ず変更してください。
SITE_NAME           | "concrete5 demo" | concrete5 サイト名です。
SAMPLE_DATA         | "elemental_full" | Elemental のサンプルコンテンツをインストールします。空白のサイトを希望する場合は "elemental_blank" と入力してください。
MYSQL_USER          | "concrete5" | You need to create the MySQL User.
MYSQL_PASS          | "concrete5" | You need to create the MySQL Password
MYSQL_SERVER        | "127.0.0.1" | MySQL サーバーのアドレスです。
MYSQL_DATABASE      | "c9" | MySQL データベース名です。
CONCRETE5_LOCALE    | "en_US" | **Cloud9 では正常に動きません。** concrete5 インストール時のデフォルトのロケールを入力してください。8.0.0 以降では英語以外のロケールをデフォルトとしてインストールするために必須となります。

## クレジット

@katzueno

コンクリートファイブジャパン株式会社では、企業・団体様の concrete5 サイト制作や制作会社様のプロジェクトのサポートを行っています。

https://concrete5.co.jp/
