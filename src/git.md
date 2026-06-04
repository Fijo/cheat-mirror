# Git

## Move remote repo

```
git fetch origin
git branch -a
git remote add new-origin git@github.com:Fijo/myRepo.git
git push --all new-origin
git push --tags new-origin
git remote rm origin
git remote rename new-origin origin
```

[Source](https://stackoverflow.com/a/38303789)
