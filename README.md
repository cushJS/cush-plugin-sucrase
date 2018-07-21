# cush-plugin-sucrase v0.1.0

This plugin handles [Flow][1], [TypeScript][2], [JSX][3], and ES modules.

### [Learn more][0]

[0]: https://github.com/alangpierce/sucrase
[1]: https://github.com/facebook/flow
[2]: https://github.com/Microsoft/TypeScript
[3]: https://reactjs.org/docs/jsx-in-depth.html

This plugin is *required* by [js-bundle][2].

[4]: https://github.com/aleclarson/js-bundle

### Flow

Strip flow types from assets.

Packages using flow must have [flow-bin](https://www.npmjs.com/package/flow-bin) in their `devDependencies`.

### TypeScript

Strip types from `.ts` and `.tsx` assets.

The [typescript](https://github.com/cushJS/cush-plugin-typescript) plugin is **required** for TypeScript assets to be recognized.

The [jsx](https://github.com/cushJS/cush-plugin-jsx) plugin is **required** for `.tsx` assets to be recognized.

### JSX

Transform JSX to valid Javascript.

Assets containing JSX must have the `.jsx` file extension.

The [jsx](https://github.com/cushJS/cush-plugin-jsx) plugin is **required** for JSX assets to be recognized.

### ES modules

`module.exports = exports.default;` is used when a module only has an `export default` statement. This often eliminates the need for `require('es-module').default`.
