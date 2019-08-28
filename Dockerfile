FROM golang:1.12.9-alpine3.10 AS build

RUN apk add --update --no-cache gcc git build-base

WORKDIR /src/
COPY main*.go go.* /src/
RUN CGO_ENABLED=0 go build -o /bin/hello

FROM scratch
COPY --from=build /bin/hello /bin/hello
ENTRYPOINT ["/bin/hello"]