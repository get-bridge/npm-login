# npm-login

![ci](https://github.com/get-bridge/npm-login/workflows/ci/badge.svg)
![tag](https://img.shields.io/github/v/tag/get-bridge/npm-login?sort=semver)

**Please note: This action is deprecated and should no longer be used. Please, migrate your workflows to the [actions/setup-node](https://github.com/actions/setup-node) action. To authenticate with `actions/setup-node` use the following general approach which has been adapted from the official [documentation](https://github.com/actions/setup-node/blob/270253e841af726300e85d718a5f606959b2903c/docs/advanced-usage.md#use-private-packages):**

    - uses: actions/checkout@v2

    - uses: actions/setup-node@v2
      with:
        registry-url: http://npm.pkg.github.com

    # Skip post-install scripts here, as a malicious script could steal NODE_AUTH_TOKEN.
    - run: npm install --ignore-scripts
      env:
        NODE_AUTH_TOKEN: ${{ secrets.YOUR_SEKRET_TOKEN_HERE }}

    # `npm rebuild` will run all those post-install scripts for us.
    - run: npm rebuild && npm run prepare --if-present

The `npm-login` action will setup the local npm configuration to be
able to connect to a specific scope.

## Usage

Typical usage of this action looks like this:

    - uses: get-bridge/npm-login@v1
      with:
        email: ${{ secrets.NPM_EMAIL }}
        password: ${{ secrets.NPM_PASSWORD }}
        registry: //some-registry/
        scope: some-scope
        username: ${{ secrets.SCOPE }}

## Customizing

### inputs

Following inputs can be used as `step.with` keys or via the corresponding environment variable. The `steps.with` values will take precidence over equivalent environment variables.

| Name        | env var              | Required  | Default  | Type    | Description                         |
|-------------|----------------------|-----------|----------|---------|-------------------------------------|
| `email`     | `NPM_LOGIN_EMAIL`    | true      |          | String  | Email associated with the username. |
| `password`  | `NPM_LOGIN_PASSWORD` | true      |          | String  | Password for authentication. |
| `protocol`  |                      | false     | `https`  | String  | Set the protocol (e.g. `http`,`https`) |
| `registry`  | `NPM_LOGIN_REGISTRY` | true      |          | String  | Registry to use for the desired scope. Must leave off preceeding protocol and include trailing slash like `//example.com/` |
| `scope`     | `NPM_LOGIN_SCOPE `   | true      |          | String  | The desired scope. Leave off the preceeding `@`. (e.g. `myscope`) |
| `username`  | `NPM_LOGIN_USERNAME` | true      |          | String  | Username for authentication. |
