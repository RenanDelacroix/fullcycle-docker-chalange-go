FROM golang:latest AS builder

ENV CGO_ENABLED=0 GOOS=linux GOARCH=amd64

WORKDIR /app

RUN echo 'package main\n\nimport "fmt"\n\nfunc main() {\n    fmt.Println("Full Cycle Rocks!!")\n}' > hello.go && \
    go build -o hello hello.go

FROM scratch

COPY --from=builder /app/hello /hello

CMD ["/hello"]