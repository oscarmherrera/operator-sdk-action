# Operator-SDK Github Action

This action allows usage of the operator-sdk CLI tool.

## Inputs

`image`

**Required** The name of the docker image.

`tag`

**Optional** The tag of the docker image. Default `"latest"`.

`dirPath`

**Optional** Project structure requires build/Dockerfile.

`args`

**Optional** Additional arguments passed to operator-sdk build.
This should be a string of additional arguments.

For example, to produce a static build,
set args to: `--go-build-args "-a -installsuffix cgo -ldflags=-extldflags=-static"`

## Outputs

`image`

Built image name

## Example usage

```yaml
uses: hensur/operator-sdk-github-action
with:
    image: "example"
    tag: 1.0
    dirPath: "/path/to/build/dockerfile"
```
