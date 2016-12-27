# randoms

A small and simple web service that returns JSON formatted pseudorandom data - numbers, hexadecimal numbers, UUIDs, and base 64 strings. An excuse to try out [Crystal](https://crystal-lang.org/) and the companion web framework, [Kemal](http://kemalcr.com/). Originally considered as a useful idea as a data source for [Workflow](https://workflow.is/)

## Installation

- install crystal
- `crystal build --release src/randoms.cr`

## Usage

- `./randoms`
- visit [localhost:3000](http://localhost:3000)

## Endpoints

- `/hex` returns JSON with data: {random: "b48ed003fbe56939b9b1715542146084"} 
- `/hex?length=3` returns JSON with data: {random: "b48ed0"} 
- `/number` returns JSON with data: {random: "88"} 
- `/number?length=10` returns JSON with data: {random: "8"} 
- `/uuid` returns JSON with data: {random: "fc07646c-c24b-4744-a31a-87c979a80e26"} 
- `/base64` returns JSON with data: {random: "KCbA8xgLGyddXMf6X3dzFg=="} 

```js
{
  "method": "hex",
  "data": {
    "random": "f87b10c557f16361c9de82afbcfdd257"
  },
  "responded_at": "2016-12-27T21:20:57+0000"
}
```

## Contributing

1. Fork it ( https://github.com/chaserx/randoms/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [chaserx](https://github.com/chaserx) Chase Southard - creator, maintainer
