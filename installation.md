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

## Plugin

The plugin is easy to add, just create a file called `book.json`. Include the plugin into this file:

- `mathjax`: use to include the latex format in the gitbook
- `intopic-toc`: table of contents on the right shows the contents in the article
- `search-pro`: better search tool
- `splitter`: enable the content column to be moved

```
{
    "plugins": ["mathjax",
				"intopic-toc",
				"search-pro",
				"-lunr",
				"-search",
				"splitter",
				"klipse"
				]
}
```

## Conversion from jupyter notebook to markdown
```
jupyter nbconvert --to md < input notebook >
```



# Lxplus

For the lxplus in CERN, we already had `npm` and `node` installed. We only need to initialize the `package.json` suggested [here](https://segmentfault.com/q/1010000012930521)

```
npm init -f
```

However, the steps are the same but can only be done with user permission but not superuser permission. Therefore, we need to use the local setup without `sudo` and `-g` argument when the installation. After the installation, the packages and the commands are stored in the `~/node_modules/<package>/bin/`. (see [here](https://stackoverflow.com/questions/18015462/where-does-npm-store-node-modules)) For example, the `n` package is stored in the `~/node_modules/n/bin/`.

To export all these commands, we can just export these paths.
```
export PATH=$(npm bin):$PATH
```

### Issue resolved:

```
Error: ENOENT: no such file or directory, stat '/eos/home-m/metsai/www/HBSM_Notes/public/gitbook/gitbook-plugin-fontsettings/fontsettings.js'
```
This can be solved with [this discussion](https://github.com/GitbookIO/gitbook-cli/issues/55).
