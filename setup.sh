jupyter nbconvert --to markdown *.ipynb
gitbook build . public
git add .
git commit -m "Automatically update"
git push
