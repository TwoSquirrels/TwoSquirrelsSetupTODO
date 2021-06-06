# Git configurations

## 参考

- [Gitをインストールしたら真っ先にやっておくべき初期設定 - Qiita](https://qiita.com/wnoguchi/items/f7358a227dfe2640cce3)
- [gitのdiff, status, logを極限までコンパクト化＋便利化する - Qiita](https://qiita.com/yuya_presto/items/ef199e08021dea777715)

## 設定

### ユーザー情報

名前とメアドを指定
```shell
git config --global user.name "TwoSquirrels"
git config --global user.email "RisuRisu.TwoSquirrels@gmail.com"
```

### エディター

vimよりもemacs派
```shell
git config --global core.editor 'emacs -nw'
export GIT_EDITOR=emacs
```

`~/.bash_aliases`で環境変数を設定するように
```shell
export GIT_EDITOR=emacs
```

### 色

diffを見やすく！
```shell
git config --global color.ui auto
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
```

### ファイル名変更を追跡

```shell
git config --global diff.renames true
```

### エイリアス

よく使うもの/使いたいもの
```shell
git config --global alias.status 'status --short --branch'
git config --global alias.log 'log --stat --decorate --find-renames'
git config --global alias.graph 'log --graph --decorate --oneline'
```
