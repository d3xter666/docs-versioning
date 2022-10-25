# UI5 CLI
## Requirements
- [Node.js](https://nodejs.org/) Version 10 or later

## Installation

Install the CLI using the npm package manager:

```sh
npm install --global @ui5/cli

# Verify installation
ui5 --help
```

## Usage/Syntax

`
 ui5 <command> [options]
`

The CLI automatically checks for updates using [update-notifier](https://github.com/yeoman/update-notifier). While this is skipped in CI environments, you might also opt-out manually by following the steps described [here](https://github.com/yeoman/update-notifier/blob/master/readme.md#user-settings).

## Common options

These options you can use with each command.

| Option | Description | Details |
| --- | --- | --- |
| -h, --help | Show help | [boolean] |
| -v, --version | Show version number | [boolean] |
| --config | Path to project configuration file in YAML format | [string] |
| --dependency-definition | Path to a YAML file containing the project&#x27;s dependency tree. This option will disable resolution of node package dependencies. | [string] |
| --verbose | Enable verbose logging. | [boolean] |
| --loglevel, --log-level | Set the logging level (error\|warn\|info\|verbose\|silly). | [string] [default: &quot;info&quot;] |
| --x-perf | Outputs performance measurements | [boolean] [default: false] |

## Examples

Execute command using a &quot;static&quot; translator with translator parameters
```
ui5 <command> --translator static:/path/to/projectDependencies.yaml
```
Execute command using a project configuration from custom path
```
ui5 <command> --config /path/to/ui5.yaml
```

## Commands

### ui5 add

**Description**

Add SAPUI5/OpenUI5 framework libraries to the project configuration.

**Usage**

`
ui5 add [--development] [--optional] <framework-libraries..>
`


**Options**

| Option | Description | Details |
| --- | --- | --- |
| -D, --development, --dev | Add as development dependency | [boolean] [default: false] |
| -O, --optional | Add as optional dependency | [boolean] [default: false] |

**Positionals**

| Positional | Description | Details |
| --- | --- | --- |
| framework-libraries | Framework library names | [array] [required] [default: []] |

**Examples**

Add the framework libraries sap.ui.core and sap.m as dependencies
```
ui5 add sap.ui.core sap.m
```
Add the framework library sap.ui.support as development dependency
```
ui5 add -D sap.ui.support
```
Add the framework library themelib_sap_fiori_3 as optional dependency
```
ui5 add --optional themelib_sap_fiori_3
```
### ui5 build

**Description**

Build project in current directory

**Usage**

`
ui5 build
`

**Child Commands**

| Command | Description |
| --- | --- |
| ui5 build jsdoc | Build JSDoc resources |
| ui5 build preload | (default) Build project and create preload bundles |
| ui5 build self-contained | Build project and create self-contained bundle. Recommended to be used in conjunction with --include-dependencies |

**Options**

| Option | Description | Details |
| --- | --- | --- |
| -a, --include-all-dependencies, --all | Include all dependencies in the build result | [boolean] [default: false] |
| --include-dependency | A list of dependencies to be included in the build result. You can use the asterisk &#x27;*&#x27; as an alias for including all dependencies in the build result. The listed dependencies cannot be overruled by dependencies defined in &#x27;exclude-dependency&#x27;. | [array] |
| --include-dependency-regexp | A list of regular expressions defining dependencies to be included in the build result. This list is prioritized like &#x27;include-dependency&#x27;. | [array] |
| --include-dependency-tree | A list of dependencies to be included in the build result. Transitive dependencies are implicitly included and do not need to be part of this list. These dependencies overrule the selection of &#x27;exclude-dependency-tree&#x27; but can be overruled by &#x27;exclude-dependency&#x27;. | [array] |
| --exclude-dependency | A list of dependencies to be excluded from the build result. The listed dependencies can be overruled by dependencies defined in &#x27;include-dependency&#x27;. | [array] |
| --exclude-dependency-regexp | A list of regular expressions defining dependencies to be excluded from the build result. This list is prioritized like &#x27;exclude-dependency&#x27;. | [array] |
| --exclude-dependency-tree | A list of dependencies to be excluded from the build result. Transitive dependencies are implicitly included and do not need to be part of this list. | [array] |
| --dest | Path of build destination | [string] [default: &quot;./dist&quot;] |
| --clean-dest | If present, clean the destination directory before building | [boolean] [default: false] |
| --create-build-manifest | Store build metadata in a &#x27;.ui5&#x27; directory in the build destination, allowing reuse of the build result in other builds | [boolean] [default: false] |
| --include-task | A list of tasks to be added to the default execution set. This option takes precedence over any excludes. | [array] |
| --exclude-task | A list of tasks to be excluded from the default task execution set | [array] |
| --framework-version | Overrides the framework version defined by the project | [string] |
| --experimental-css-variables | Generate CSS variables (css-variables.css, css-variables.source.less) and skeleton (library-skeleton(-RTL).css) for all themes | [boolean] [default: false] |


**Examples**

Preload build for project without dependencies
```
ui5 build
```
Self-contained build for project including dependencies
```
ui5 build self-contained --all
```
Build project and dependencies but only apply the createDebugFiles- and generateAppPreload tasks
```
ui5 build --all --exclude-task=* --include-task=createDebugFiles generateAppPreload
```
Build project and dependencies by applying all default tasks including the createDebugFiles task and excluding the generateAppPreload task
```
ui5 build --all --include-task=createDebugFiles --exclude-task=generateAppPreload
```
Build project and dependencies in dev mode, except &quot;sap.ui.core&quot; and &quot;sap.m&quot; (useful in combination with --include-task)
```
ui5 build dev --all --dev-exclude-project=sap.ui.core sap.m
```
Build project and dependencies in dev mode. Only a set of essential tasks is executed.
```
ui5 build dev
```
Preload build for project without dependencies but with CSS variable artifacts
```
ui5 build --experimental-css-variables
```
### ui5 init

**Description**

Initialize the UI5 Tooling configuration for an application or library project.

**Usage**

`
ui5 init
`




### ui5 remove

**Description**

Remove SAPUI5/OpenUI5 framework libraries from the project configuration.

**Usage**

`
ui5 remove <framework-libraries..>
`



**Positionals**

| Positional | Description | Details |
| --- | --- | --- |
| framework-libraries | Framework library names | [array] [required] [default: []] |

**Examples**

Remove the framework libraries sap.ui.core and sap.m as dependencies
```
ui5 remove sap.ui.core sap.m
```
### ui5 serve

**Description**

Start a web server for the current project

**Usage**

`
ui5 serve
`


**Options**

| Option | Description | Details |
| --- | --- | --- |
| -p, --port | Port to bind on (default for HTTP: 8080, HTTP/2: 8443) | [number] |
| -o, --open | Open web server root directory in default browser. Optionally, supplied relative path will be appended to the root URL | [string] |
| --h2 | Shortcut for enabling the HTTP/2 protocol for the web server | [boolean] [default: false] |
| --simple-index | Use a simplified view for the server directory listing | [boolean] [default: false] |
| --accept-remote-connections | Accept remote connections. By default the server only accepts connections from localhost | [boolean] [default: false] |
| --key | Path to the private key | [string] [default: &quot;~/.ui5/server/server.key&quot;] |
| --cert | Path to the certificate | [string] [default: &quot;~/.ui5/server/server.crt&quot;] |
| --sap-csp-policies | Always send content security policies &#x27;sap-target-level-1&#x27; and &#x27;sap-target-level-2&#x27; in report-only mode | [boolean] [default: false] |
| --serve-csp-reports | Collects and serves CSP reports upon request to &#x27;/.ui5/csp/csp-reports.json&#x27; | [boolean] [default: false] |
| --framework-version | Overrides the framework version defined by the project | [string] |


**Examples**

Start a web server for the current project
```
ui5 serve
```
Enable the HTTP/2 protocol for the web server (requires SSL certificate)
```
ui5 serve --h2
```
Use the project configuration from a custom path
```
ui5 serve --config /path/to/ui5.yaml
```
Use a &quot;static&quot; translator with translator parameters.
```
ui5 serve --translator static:/path/to/projectDependencies.yaml
```
Listen to port 1337 and launch default browser with http://localhost:1337/test/QUnit.html
```
ui5 serve --port 1337 --open tests/QUnit.html
```
### ui5 tree

**Description**

Outputs the dependency tree of the current project to stdout. It takes all relevant parameters of ui5 build into account.

**Usage**

`
ui5 tree
`


**Options**

| Option | Description | Details |
| --- | --- | --- |
| --framework-version | Overrides the framework version defined by the project | [string] |
|  |  |  |


### ui5 use

**Description**

Initialize or update the project&#x27;s framework configuration.

**Usage**

`
ui5 use <framework-info>
`



**Positionals**

| Positional | Description | Details |
| --- | --- | --- |
| framework-info | Framework name, version or both (name@version).<br>Name can be &quot;SAPUI5&quot; or &quot;OpenUI5&quot; (case-insensitive).<br>Version can be &quot;latest&quot; (default), &quot;1.xx&quot; or &quot;1.xx.x&quot;. | [string] [required] |

**Examples**

Use SAPUI5 in the latest available version
```
ui5 use sapui5@latest
```
Use OpenUI5 in the latest available 1.76 patch version
```
ui5 use openui5@1.76
```
Use the latest available version of the configured framework
```
ui5 use latest
```
Use OpenUI5 in the latest available version
```
ui5 use openui5
```
### ui5 versions

**Description**

Shows the versions of all UI5 Tooling modules

**Usage**

`
ui5 versions
`





## Local vs. Global Installation
In general, we recommend a global installation of the UI5 CLI (`npm install --global @ui5/cli`).

However, it makes sense to add the UI5 CLI as a [devDependency](https://docs.npmjs.com/files/package.json#devdependencies) (`npm install --save-dev @ui5/cli`) to a project's `package.json`. This ensures that every developer working on the project uses the same version of the UI5 CLI and your continuous integration environments also uses this version.

In case you have both, a local installation in one of your projects as well as a global installation, the UI5 CLI will always try to invoke the local installation. This is in part because [npm scripts](https://docs.npmjs.com/misc/scripts) defined in your `package.json` will also always invoke the local installation.

This behavior can be disabled by setting the environment variable `UI5_CLI_NO_LOCAL`.

**Example**  
You have a project located in the directory `/my-application`.

You have installed the UI5 CLI globally. In addition, the project's `package.json` defines a `devDependency` to `@ui5/cli` and a start script `"ui5 serve"`. This means there are at least two installations of `@ui5/cli` on your system. Their versions might not match.

This table illustrates which of the two installations is used in different scenarios. Note how the UI5 CLI always tries to prefer the version installed in the project.

| Current Working Directory | Command                         | Global UI5 CLI | Local UI5 CLI |
| ------------------------- | ------------------------------- | :-----------------------------: | :----------------------------: |
| `/`                       |  `ui5 --version`                |  {: .sap-icon-circle-task-2 }   |
| `/my-application`         |  `ui5 --version`                |                                 |  {: .sap-icon-circle-task-2 }  |
| `/my-application`         |  `ui5 serve`                    |                                 |  {: .sap-icon-circle-task-2 }  |
| `/my-application`         |  `UI5_CLI_NO_LOCAL=X ui5 serve` |  {: .sap-icon-circle-task-2 }   |
| `/my-application`         |  `npm start`                    |                                 |  {: .sap-icon-circle-task-2 }  |
| `/my-application`         |  `UI5_CLI_NO_LOCAL=X npm start` |                                 |  {: .sap-icon-circle-task-2 }  |
