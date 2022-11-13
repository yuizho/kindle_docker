# Kindle in Docker

## 使い方

### インストール

```console
docker build -t kindle_img ./
./install_kindle.sh
```

初回の起動時に、サインイン先を `amazon.co.jp` にして、メールアドレス、パスワードを入力する。

### 実行

```console
./start_kindle.sh
```

or desktop から起動できるようになっているのでそちらから起動

### その他

Kindle for PC で、Windows 7 の警告を消す方法。

```console
docker_kindle /bin/bash
winecfg
# Windows Version を Windows 8 にする
exit
```

[解説記事](https://zenn.dev/junkawa/articles/chromeosflex_install_kindleforpc)
