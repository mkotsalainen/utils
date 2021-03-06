
function out {
    echo "\033[0;33m$1\033[0m"
}

out "moving features from Downloads to ssk"

if [ -f ~/Downloads/ssk*.tar ]
then
    mv ~/Downloads/ssk*.tar ~/projects/ssk/www/sites/all/modules/custom/
    cd ~/projects/ssk/www/sites/all/modules/custom/
    tar -xvzf *.tar
    rm *.tar
fi

out "resetting ssk2"

cd ~/projects/ssk2/www
d7_reset ssk2
rm -rf ~/projects/ssk2/www/sites/all/modules/custom/
git pull

out "copying features from ssk to ssk2"

cp -r ~/projects/ssk/www/sites/all/modules/custom/ ~/projects/ssk2/www/sites/all/modules/custom/

features="module_filter diff ssk_*"
#features="module_filter diff"
out "enabling features on ssk2: $features"
drush -y en $features 
