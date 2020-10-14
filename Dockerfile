

#FROM golang as  go-builder
FROM golang:1.15.1-alpine3.12 as go-builder

RUN apk add --no-cache gcc g++
WORKDIR /go/src/github.com/yyn1110/kafka_exporter
COPY . ./
#RUN go mod vendor


RUN go build

FROM alpine:3.12


COPY --from=go-builder /go/src/github.com/yyn1110/kafka_exporter/kafka_exporter /bin/kafka_exporter
COPY kafka_exporter.yml /etc/kafka_exporter.yml

EXPOSE     9308

ENTRYPOINT [ "/bin/kafka_exporter" ]