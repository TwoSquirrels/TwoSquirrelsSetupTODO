# Termux

## Install

- [Termux](https://play.google.com/store/apps/details?id=com.termux)
- [Termux:API](https://play.google.com/store/apps/details?id=com.termux.api)

## Setup

### [Set DebianCUI configurations](/Debian.md)

### connect to sdcard

```shell
termux-setup-storage
```

### set extra keys

Insert to Extra keys in ~/.termux/termux.properties

```properties
# Originals
extra-keys = [["ESC","TAB",".",{key:"DEL",popup:{macro:"CTRL d"}},"HOME","UP","END"], \
              ["CTRL","ALT","_","-","LEFT","DOWN","RIGHT"]]
```

### set bell to ignore

comment out Bell key in ~/.termux/termux.properties

```properties
bell-character = ignore
```

### set font

```shell
cd /sdcard/Download
wget https://github.com/miiton/Cica/releases/download/v5.0.2/Cica_v5.0.2_with_emoji.zip
unzip -d Cica_v5.0.2_with_emoji Cica_v5.0.2_with_emoji.zip
cp Cica_v5.0.2_with_emoji/Cica_Regular.ttf ~/.termux/font.ttf
```

### set api commands

```shell
pkg i termux-api -y
cat <<EOF >> ~/.bash_aliases

# copy
alias pbcopy="termux-clipboard-set"

# open
alias open="termux-open"
EOF
exec bash -l
```
