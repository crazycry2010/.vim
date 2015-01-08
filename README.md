vim
===

1.添加submodule
git submodule add repos path
e.g.
git submodule add https://github.com/crazycry2010/submodule/***   ./submodule/***

2. clone
2.1 clone submodle
git submodule init
git submodule update
2.2 clone 整个工程和submodule
git clone --recursive https://github.com/crazycry2010/***

3. 工程1中，修改submodule并提交
3.1 修改submodle工程，并提交
cd submodule/***
// vi ***(修改)
git checkout master
git add .
git commint -m "MOD: ***"
git push
3.2 提交工程1
git commit -a -m "***"
git push

4. 协同开发工程1的人，更新submodule
git pull
git submodule update

5. 工程2中，更新submodule
git submodule foreach git checkout master
git submodule foreach git pull
或
git pull
git submodule sync
git submodule update --init --recursive

4 和 5 有点乱，是其他帖子的节奏。
总结一下，
1）要想更新到最新的submodule
git submodule foreach git checkout master
git submodule foreach git pull
2） 有些工程可能不能使用最新版本的submodule，只能更新到主工程中指定的版本
git pull
git submodule update

6. 移除submodule
6.1 删除git cach文件和物理文件
git rm -r --cached submodule/***
rm -r submodule/***
6.2 删除 .gitmodules 中相应的submodule条目
6.3 删除 .git/config 中相应的submodule条目
之后
git add .
git commit -m "DEL: submodule/***"
git push


crazycry2010 's vim setting
