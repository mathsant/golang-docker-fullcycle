FROM golang:1.20-alpine as builder

WORKDIR /usr/src/app

COPY . .

RUN go build -o fullcycle

FROM scratch

COPY --from=builder /usr/src/app/fullcycle /fullcycle

ENTRYPOINT [ "/fullcycle" ]