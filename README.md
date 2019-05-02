# purescript-deasync

Bindings to [deasync](https://github.com/abbr/deasync). NodeJS only.

Don't forget to run `npm install deasync`.

# API

#### `deasync`

``` purescript
deasync :: forall a. (Effect (Promise a)) -> Effect a
```

#### `deasyncAff`

``` purescript
deasyncAff :: forall a. Aff a -> Effect a
```
