FROM golang:1.12

COPY build.sh /go

RUN /go/build.sh

FROM gcr.io/distroless/base

COPY --from=0 /go/caddy /

EXPOSE 80 443

VOLUME /home

WORKDIR /home

ENTRYPOINT [ "/caddy" ]

CMD [ "-agree" ]

