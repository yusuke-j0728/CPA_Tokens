rsync -r src/ docs/
rsync build/contracts/*  docs/

git add .
git commit -m '#15 Compiles asset for github pages'
git push origin master