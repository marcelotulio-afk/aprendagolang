FROM golang:1.18 AS build

WORKDIR /app

COPY go.mod ./
COPY hello.go ./

RUN go build -o /server

FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /server /server

EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT [ "/server" ]



