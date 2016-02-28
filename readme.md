# concrete5 easy install shell script

This is the easy to use install script.
I've first made one for Cloud9.

Japanese instruction follows English instruction.

日本語の解説は、英語の後に

## Instruction of cloud 9

Run the following command and modify the config from Cloud9

1. `curl https://raw.githubusercontent.com/katzueno/concrete5-install-shell-scripts/master/install.cloud9.bash > install.cloud9.bash`
2. Copy and paste the following command within Cloud9 command window. (Make sure to *return* the `exit;` to exit MySQL)
```
mysql-ctl start
mysql-ctl cli
CREATE USER 'concrete5'@'127.0.0.1' IDENTIFIED BY 'concrete5';
GRANT ALL PRIVILEGES ON *.* TO 'concrete5'@'127.0.0.1' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit;

```
3. Open the install.cloud9.bash into Cloud9 editor and modify the MySQL Username, admin email, admin password or other preferences if you wish. See the config section below.
4. `chmod 700 install.cloud9.bash`
5. `bash install.cloud9.bash`

**CAUTION: YOU MUST change your password** If you run a lot of concrete5 installs, I recommend you to fork this Git onto your private repo.

### Config Options

Check where the VARIABLE in the  `install.cloud9.bash` script and change wherever necessary. 

Parameter           | Default Value | Description
----------          | ------------ | -----
ADMIN_EMAIL         | "concrete5@example.com" | Change it to your email address
ADMIN_PASS          | "t4wbSIDuQgfy" | **IMPORTANT!** This is your concrete5's admin password. So make sure to change it.
SITE_NAME           | "concrete5 demo" | concrete5 site name.
SAMPLE_DATA         | "elemental_full" | If you want to install the blank sample data, use "elemental_blank"
MYSQL_USER          | "CLOUD9USERNAME" | You MUST change it to your cloud9 username
MYSQL_PASS          | ""    | You can leave it to blank if you wish to use the default MySQL
MYSQL_SERVER        | "127.0.0.1" | MySQL Server Address
MYSQL_DATABASE      | "c9" | MySQL Database Name
CONCRETE5_DOWNLOAD  | "http://www.concrete5.org/download_file/-/view/85780/" | This is download URL of concrete5 zip file
CONCRETE5_VERSION   | "concrete5.7.5.6" | You MUST change it you are downloading the different version
DESTINATION         | "/home/ubuntu/workspace" | This script will install onto the top directory of Cloud9. Change it if you wish to install onto different directory.
CONCRETE_PHP_RAW    | "https://raw.githubusercontent.com/katzueno/cloud9-concrete5-install-script/master/config/concrete.php" | This is the special script to be able to run concrete5 on Cloud9. [Read here](https://www.concrete5.org/community/forums/installation/concrete5-on-cloud9/) for more detail.
INSTALL_PHPMYADMIN  | "yes" | "yes" to install phpMyAdmin. Remove this line if you don't want to.

## License

This script is released under MIT License.

## Credit

@katzueno (concret5 Japan, Inc.)

concrete5 Japan, Inc. is helping various company's concrete5 project. Please feel free to contact us at any time for your project needs. We can work internationally.

https://concrete5.co.jp/


### 使用方法

下記の方法で、Cloud9 のコマンドを実行してください。テキストファイルの変更も必要です。

1. コマンド `curl https://raw.githubusercontent.com/katzueno/concrete5-install-shell-scripts/master/install.cloud9.bash` を実行
2. 下記のコマンドをコピーして、コマンドウインドウでそのまま実行してください。 (最後の`exit;` をきちんと *改行* して ** MySQL を終了してください)
```
mysql-ctl start
mysql-ctl cli
CREATE USER 'concrete5'@'127.0.0.1' IDENTIFIED BY 'concrete5';
GRANT ALL PRIVILEGES ON *.* TO 'concrete5'@'127.0.0.1' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit;

```
2. 「instal.cloud9.bash」ファイルを Cloud9 のテキストエディタで開いて `MYSQL_USER` (Cloud9 のユーザ名), `ADMIN_EMAIL` (自分のメールアドレス), `ADMIN_PASS` (admin ユーザーのパスワード) や他の設定情報を変更してください。下記に設定項目の説明があります。
3. コマンド `chmod 700 install.cloud9.bash` を実行
4. コマンド `bash install.cloud9.bash` を実行


**注意: パスワードは変えてください。** 必要ならこの Git をプライベートレポジトリに Fork することをお勧めします。


### 設定オプション

`install.cloud9.bash`の「VARIABLE」のところで設定できる項目です。適宜変更してください。


パラメーター        | デフォルト値 | 説明
----------          | ------------ | -----
ADMIN_EMAIL         | "concrete5@example.com" | 自分のメールアドレスに変更してください。
ADMIN_PASS          | "t4wbSIDuQgfy" | **重要!** これは concrete5 の「admin」のパスワードです。必ず変更してください。
SITE_NAME           | "concrete5 demo" | concrete5 サイト名です。
SAMPLE_DATA         | "elemental_full" | Elemental のサンプルコンテンツをインストールします。空白のサイトを希望する場合は "elemental_blank" と入力してください。
MYSQL_USER          | "CLOUD9USERNAME" | 自分の Cloud9 のユーザー名に変更してください。
MYSQL_PASS          | ""    | Cloud9 のデフォルトでは MySQL のパスワードはないので空白のままでOKです。
MYSQL_SERVER        | "127.0.0.1" | MySQL サーバーのアドレスです。
MYSQL_DATABASE      | "c9" | MySQL データベース名です。
CONCRETE5_DOWNLOAD  | "http://www.concrete5.org/download_file/-/view/85780/" | これは concrete5 本体パッケージのダウンロード先 URL です。
CONCRETE5_VERSION   | "concrete5.7.5.6" | 上記 concrete5 の ZIP ファイルを解答した時に生成されるフォルダ名です。
DESTINATION         | "/home/ubuntu/workspace" | concrete5 のインストール先ディレクトリを指定します。デフォルトでは Cloud9 のトップディレクトリにインストールします。
CONCRETE_PHP_RAW    | "https://raw.githubusercontent.com/katzueno/cloud9-concrete5-install-script/master/config/concrete.php" | Cloud9 で concrete5 を動かすための config ファイルです。詳細は[こちら](https://concrete5.co.jp/blog/cloud9-concrete5)をご覧ください。
INSTALL_PHPMYADMIN  | "yes" | "yes" で phpMyAdmin をインストールします。必要なければコメントアウトするか、この行を削除してください。

## クレジット

@katzueno

コンクリートファイブジャパン株式会社では、企業・団体様の concrete5 サイト制作や制作会社様のプロジェクトのサポートを行っています。

https://concrete5.co.jp/
