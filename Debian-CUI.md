# Debian(CUI)

## apt

```shell
apt update ; apt upgrade -y
```

## japanese

```shell
apt install language-pack-ja -y; update-locale LANG=ja_JP.UTF8
exec $SHELL -l
dpkg-reconfigure tzdata; apt install manpages-ja-dev -y
exec $SHELL -l
```

## useful

```shell
apt install zip unzip -y
apt install wget curl -y
apt install screenfetch neofetch -y
apt install tree -y
```

- [ ] trash-cli
- [ ] [Emacs](Emacs.md)

## 
