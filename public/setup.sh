jupyter nbconvert --to markdown *.ipynb
git add .
git commit -m "Automatically update"
gitbook build . public
git push
