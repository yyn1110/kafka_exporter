
GO_LDFLAGS=-ldflags "-X main.VERSION=$(date -format yyyyMMddHHmmss) -s -w"



build_cross:
	GOOS=linux   GOARCH=amd64 CGO_ENABLED=0 go build   -o release/linux/amd64/kafka_exporter       ${GO_LDFLAGS} github.com/yyn1110/kafka_exporter

	GOOS=linux   GOARCH=386   CGO_ENABLED=0 go build   -o release/linux/386/kafka_exporter         ${GO_LDFLAGS} github.com/yyn1110/kafka_exporter

