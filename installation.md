# Installation

We need to install npm and node.js for the installation. Follow from the [tutorial](https://github.com/chusiang/how-to-build-the-gitbook-with-gitbook-cli).

For Mac OSX, we can use the `brew` to install
```
brew install node npm
```

To have a stable version, we can downgrade node.js to v5.12.0.

```
sudo npm install n -g
n 5.12.0       
```

Then we should install gitbook-cli package.
```
sudo npm install -g gitbook-cli
```

Install gitbook
```
gitbook install
gitbook --version
```

## Gitbook setup

Initialize the gitbook folder
```
gitbook init

```



Create the `public` folder which will be presented in the format of the gitbook

```
gitbook build . public
```

Show the web in the localhost as a preview

```
gitbook serve
```
Then we need to update the `public` folder as the public repo to present the tutorial.
