![UI5 logo](images/UI5_logo_wide.png)

# UI5 Tooling
An open and modular toolchain to develop state-of-the-art applications based on the [UI5](https://ui5.sap.com) framework.

[**Get Started**](./pages/GettingStarted.md){: .md-button .md-button--primary .sap-icon-initiative }


## Main Features
### ๐ป UI5 CLI
*Also see the [UI5 CLI Documentation](./pages/CLI.md)*

```sh
# Global
npm install --global @ui5/cli

# In your project
npm install --save-dev @ui5/cli
```

#### โ๏ธ Project Setup

Configure your project for use with UI5 Tooling.  
*Also see the [Configuration Documentation](./pages/Configuration.md)*

```
โฏ ui5 init
Wrote ui5.yaml:

specVersion: '2.6'
metadata:
  name: my-app
type: application
```

#### ๐ Dependency Management

UI5 framework dependencies are managed by the tooling. All other dependencies are managed by your favorite node package manager.

```
โฏ ui5 use SAPUI5@1.76.0
Updated configuration written to ui5.yaml
This project is now using SAPUI5 version 1.76.0

โฏ ui5 add sap.ui.core sap.m themelib_sap_fiori_3
Updated configuration written to ui5.yaml
Added framework libraries sap.ui.core sap.m themelib_sap_fiori_3 as dependencies
```

#### ๐ Development Server
Start a local development server to work on your project.  
*Also see the [Server Documentation](./pages/Server.md)*

```
โฏ ui5 serve
Server started
URL: http://localhost:8080
```

#### ๐  Build for Production
Build an optimized version of your project.  
*Also see the [Builder Documentation](./pages/Builder.md)*

```
โฏ ui5 build
Building my-app...
๐จ (1/8) Running task escapeNonAsciiCharacters...
๐จ (2/8) Running task replaceCopyright...
๐จ (3/8) Running task replaceVersion...
๐จ (4/8) Running task generateFlexChangesBundle...
๐จ (5/8) Running task generateComponentPreload...
๐จ (6/8) Running task createDebugFiles...
๐จ (7/8) Running task uglify...
๐จ (8/8) Running task generateVersionInfo...
Build succeeded in 363 ms
```

### ๐งช Node.js API
Most UI5 Tooling modules provide JavaScript APIs for direct consumption in other Node.js projects.
This allows you to rely on UI5 Tooling for UI5-specific build functionality and project handling, while creating your own tools to perfectly match the needs of your project.

All available APIs are documented in the [UI5 Tooling API Reference](https://sap.github.io/ui5-tooling/api/index.html).

```js linenums="1"
const {normalizer} = require("@ui5/project");
const {builder} = require("@ui5/builder");

async function buildApp(projectPath, destinationPath) {
    const tree = await normalizer.generateProjectTree({
        cwd: projectPath
    });
    await builder.build({
        tree,
        destPath: destinationPath,
        selfContained: true,
        excludedTasks: ["transformBootstrapHtml"],
        buildDependencies: true
    });
}

[...]
```
