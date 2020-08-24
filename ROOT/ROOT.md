# Introduction


### Plotting

* [Basic example of ROOT](https://swan.web.cern.ch/content/basic-examples)


# Useful features

## TTree

### TTree::Scan

We can scan variable to have a quick check on the value in the tree.
```
MyTree->Scan("var1:var2:var3","var1==0");
```
