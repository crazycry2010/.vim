vim
===

crazycry2010 's vim setting

- [Clone](#Clone)
- [Add Submodule](#Add Submodule)
- [Remove Submodule](#Remove Submodule)
- [Update Submodule](#Update Submodule)
 

Clone
-----

    git clone --recursive https://github.com/crazycry2010/.vim

or

    git clone https://github.com/crazycry2010/.vim
    git submodule update --init --recursive


Add Submodule
-------------

    git submodule add repos path
    e.g.
    git submodule add https://github.com/gmarik/Vundle.vim.git   ./submodule/Vundle


Remove Submodule
----------------

1. Remove config entries in .gitmodules

    git config -f .gitmodules --remove-section submodule.$submodulepath
    
2. Remove config entries in .git/config
    git config -f .git/config --remove-section submodule.$submodulepath
3. Remove directory from index
    git rm --cached $submodulepath
4. Track changes made to .gitmodules
    git add .gitmodules
    git commit -m "DEL: submodule $submodule_name"
    git push
5. Delete the now untracked submodule files
    rm -rf $submodulepath
    rm -rf .git/modules/$submodulepath


Update Submodule
----------------

    git submodule foreach git checkout master
    git submodule foreach git pull
 
 or
 
    git submodule sync
    git submodule update --init --recursive



crazycry2010 's vim setting
