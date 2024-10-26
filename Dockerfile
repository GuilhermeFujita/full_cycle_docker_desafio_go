FROM golang:1.23.2-alpine3.20 AS build

WORKDIR /usr/src/app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o desafio_01

FROM scratch

COPY --from=build /usr/src/app .

CMD [ "./desafio_01" ]