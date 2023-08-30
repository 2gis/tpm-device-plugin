FROM golang:1.21-alpine3.18 as build

RUN apk add --update make

WORKDIR /root
COPY . .

RUN make build

FROM alpine:3.18

LABEL description="TPM device plugin for On-Premise 2GIS" \
      source="https://github.com/2gis/tpm-device-plugin" \
      maintainer="2gis <on-premise@2gis.com>"

COPY --from=build /root/build /bin

CMD ["/bin/tpm-device-plugin"]
