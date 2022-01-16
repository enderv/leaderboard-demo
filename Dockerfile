##
## Build
##
FROM golang:1.17-buster AS build

WORKDIR /app

COPY go.mod ./
##COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /leaderboards

##
## Deploy
##
FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /leaderboards /leaderboards

EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT ["/leaderboards"]